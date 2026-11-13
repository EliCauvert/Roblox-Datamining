local Parent = script.Parent
local SignalsStockModule = require(Parent.SignalsStock)

return if game:DefineFastFlag("LuaAppSignalsMain", false) then require(Parent.SignalsMain) else SignalsStockModule