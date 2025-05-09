import Pkg
Pkg.activate(".")


using QuadGK

# 積分対象の関数：半円の上側
f(x) = sqrt(1 - x^2)

# 区間 [-1, 1] で適応型積分
result, err = quadgk(f, -1, 1)

# 出力
println("数値積分の結果: ", result)
println("理論値: ", π/2)
println("誤差推定: ", err)
println("絶対誤差: ", abs(result - π/2))
