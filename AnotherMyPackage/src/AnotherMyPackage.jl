module AnotherMyPackage

import LinearAlgebra

greet() = print("Hello World")

function mydot(x, y)
    return LinearAlgebra.dot(x, y)
end

end # module AnotherMyPackage