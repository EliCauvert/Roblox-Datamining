local Parent = script.Parent
local SignalsSchedulerStockModule = require(Parent.SignalsSchedulerStock)

return if game:DefineFastFlag("LuaAppSignalsMain", false) then require(Parent.SignalsSchedulerMain) else SignalsSchedulerStockModule