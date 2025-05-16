using Plots

# 定数の定義
c = 3e8  # 光速 (m/s)
dx = 1e-2  # 空間ステップ (m)
dt = dx / (2 * c)  # 時間ステップ (s)
nx = 200  # 空間グリッド数
nt = 500  # 時間ステップ数

# 電場と磁場の初期化



E = zeros(nx)  # 電場
H = zeros(nx)  # 磁場

# プロットの準備
plt = plot(1:nx, E, ylim=(-1.5, 1.5), label="E", xlabel="Grid", ylabel="Field")
plot!(plt, 1:nx, H, label="H")

# 時間発展
for t in 1:nt
    # 磁場の更新
    for i in 1:nx-1
        H[i] += (E[i+1] - E[i]) * dt / dx
    end

    # 電場の更新
    for i in 2:nx
        E[i] += (H[i] - H[i-1]) * dt / dx
    end

    # 電場にガウスパルスを加える
    E[nx ÷ 2] += exp(-((t - 50)^2) / 100)

    # プロットの更新
    if t % 10 == 0
        plot!(plt, 1:nx, E, label="E", xlabel="Grid", ylabel="Field", legend=false)
        plot!(plt, 1:nx, H, label="H", legend=false)
        display(plt)
    end
end