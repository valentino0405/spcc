import re

def print_code(type , lines):
    print(f"\n{type} Code:")
    for line in lines:
        if line.strip():  # This also prevents it from printing completely empty lines
            print(line.strip())

def is_pure_constant(expr):
    return re.fullmatch(r"[0-9+\-*/(). ]+", expr) is not None

def optimize_TAC(lines):
    copies = {}          
    expr_map = {}        
    output = []

    for line in lines:
        line = line.strip()
        if not line or "=" not in line:
            continue

        lhs, rhs = line.split("=")
        lhs = lhs.strip()
        rhs = rhs.strip()

        # 1. CONSTANT FOLDING
        if is_pure_constant(rhs):
            rhs = str(eval(rhs))
            output.append(f"{lhs}={rhs}")
            continue 

        # 2. COPY PROPAGATION
        tokens = re.split(r'(\W)', rhs)
        new_tokens = []
        for tok in tokens:
            while tok in copies:
                tok = copies[tok]
            new_tokens.append(tok)
        rhs = "".join(new_tokens)

        # 3. DIRECT ASSIGNMENTS
        if re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", rhs):
            copies[lhs] = rhs
            continue

        # 4. PARTIAL COMMON SUBEXPRESSION ELIMINATION (The Fix!)
        for known_expr, mapped_var in sorted(expr_map.items(), key=lambda x: len(x[0]), reverse=True):
            if known_expr in rhs and known_expr != rhs:
                rhs = rhs.replace(known_expr, mapped_var)

        # 5. FULL COMMON SUBEXPRESSION ELIMINATION
        if rhs in expr_map:
            copies[lhs] = expr_map[rhs]
        else:
            expr_map[rhs] = lhs
            output.append(f"{lhs}={rhs}")

    return output

with open("input.txt", "r") as file:
    lines = file.readlines()

print_code("Input" , lines)
optimized_code = optimize_TAC(lines)
print_code("Optimized" , optimized_code)
