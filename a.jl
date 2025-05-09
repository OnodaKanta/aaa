# 2重指数型積分の実装（DE積分）
# --- 前提 ---
# f(x) = sqrt(1 - x^2) を [-1, 1] で積分し、π/2 を得る。

# 被積分関数
f(x) = sqrt(1 - x^2)

# 変数変換後の関数 g(t)
g(t) = begin
    x = tanh(π/2 * sinh(t))
    dxdt = (π/2) * cosh(t) * sech(π/2 * sinh(t))^2
    f(x) * dxdt
end

# 台形則による DE 積分本体
function double_exponential_integrate(T=10.0, N=1000)
    h = 2T / N
    sum = 0.5 * (g(-T) + g(T))
    for k in 1:(N-1)
        t = -T + k*h
        sum += g(t)
    end
    h * sum
end

# 計算実行
result = double_exponential_integrate()
theoretical = π/2
error = abs(result - theoretical)

# 結果表示（println + 文字列補間）
println("DE 積分結果: ", result)
println("理論値     : ", theoretical)
println("絶対誤差   : ", error)
println("相対誤差   : ", error / abs(theoretical))
