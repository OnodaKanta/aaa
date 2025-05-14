using Zygote
using Plots

# 関数定義: 2次元ベクトル入力 → スカラー出力
f(x) = x[1]^2 + 3x[2]^2 + sin(x[1]*x[2])

# 任意の点での勾配
x = [1.0, 2.0]
∇f = gradient(f, x)[1]

println("f(x) = ", f(x))
println("∇f(x) = ", ∇f)

# 可視化: 等高線と勾配ベクトル
xs = ys = -2:0.1:2
Z = [f([x, y]) for x in xs, y in ys]

contour(xs, ys, Z', title="f(x) contours")
quiver!([x[1]], [x[2]], quiver=([∇f[1]], [∇f[2]]), color=:red, label="∇f")
