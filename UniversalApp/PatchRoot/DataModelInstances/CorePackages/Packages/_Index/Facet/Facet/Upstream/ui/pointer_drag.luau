local _ = require("../vendor/compose/core")
local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

return function(Key)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if not SelfEntry then
		SelfEntry = Key.Compose.createSharedResource(function()
			-- upvalues: Key (copy), self (upval)
			local Compose = Key.Compose
			local TypesEnum = Key.types.Enum
			local UserInputService = Key.config.userInputService or Key.config.services.UserInputService
			local PreferredInputResult = if UserInputService then Key.observe.PreferredInput(UserInputService) else Compose.cell(nil)
			local CellResult = Compose.cell(nil)
			local Connection = nil
			
			if UserInputService and UserInputService.GetLastInputType then
				CellResult:set(UserInputService:GetLastInputType())
				Connection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
					-- upvalues: CellResult (copy)
					CellResult:set(LastInputType)
				end)
			end
			return {
				preferred = PreferredInputResult,
				allowed = function(Callback): boolean
					-- upvalues: PreferredInputResult (copy), TypesEnum (copy), CellResult (copy)
					return Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.Gamepad and Callback(CellResult) ~= TypesEnum.UserInputType.Keyboard
				end
			}, function()
				-- upvalues: Connection (ref), self (upval), Key (upval)
				if Connection then
					Connection:Disconnect()
				end
				self[Key] = nil
			end
		end)
		self[Key] = SelfEntry
	end
	local v1 = assert(SelfEntry)()
	
	return v1.allowed, v1.preferred
end