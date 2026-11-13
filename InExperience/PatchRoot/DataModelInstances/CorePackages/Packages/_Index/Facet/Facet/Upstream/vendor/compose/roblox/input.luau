local CoreModule = require("../core")
local EngineModule = require("./engine")
local PreferredInputModule = require("./preferred-input")

return {
	preferredInput = function(p1, p2)
		-- upvalues: EngineModule (copy), PreferredInputModule (copy), CoreModule (copy)
		local UserInputService = if p1 == nil then EngineModule.service("UserInputService") else p1
		local CellResult = CoreModule.cell(PreferredInputModule.specOf(EngineModule.readMember(UserInputService, "PreferredInput")).class)
		local Connection = (if p2 == nil then EngineModule.ambient() else p2).propertyChanged(UserInputService, "PreferredInput"):Connect(function()
			-- upvalues: CellResult (copy), PreferredInputModule (upval), EngineModule (upval), UserInputService (copy)
			CellResult:set(PreferredInputModule.specOf(EngineModule.readMember(UserInputService, "PreferredInput")).class)
		end)
		CoreModule.cleanup(function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end)
		
		return CellResult
	end,
	preferredInputSpec = PreferredInputModule.specOf
}