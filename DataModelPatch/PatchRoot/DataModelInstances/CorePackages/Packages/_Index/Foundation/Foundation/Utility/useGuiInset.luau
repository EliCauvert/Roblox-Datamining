local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WrappersModule = require(Foundation.Utility.Wrappers)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local Connection = WrappersModule.Connection
local WrappersModuleInstance = WrappersModule.Instance
local Signal = WrappersModule.Signal
local GuiService = WrappersModule.Services.GuiService
local UserInputService = WrappersModule.Services.UserInputService

local function getGuiInset(): Rect
	-- upvalues: GuiService (copy)
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	
	return Rect.new(GuiInset, GuiInset2)
end

return function()
	-- upvalues: ReactModule (copy), getGuiInset (copy), IsPluginSecurityModule (copy), Signal (copy), GuiService (copy), WrappersModuleInstance (copy), UserInputService (copy), Connection (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: getGuiInset (upval)
		return getGuiInset()
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), getGuiInset (upval)
		UseStateResult2(getGuiInset())
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsPluginSecurityModule (upval), Signal (upval), GuiService (upval), UseResult (copy), WrappersModuleInstance (upval), UserInputService (upval), Connection (upval)
		local List = if IsPluginSecurityModule() then {
			Signal.Connect(GuiService.SafeZoneOffsetsChanged, UseResult),
			Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(UserInputService, "BottomBarSize"), UseResult),
			Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(UserInputService, "RightBarSize"), UseResult)
		} else {}
		
		return function()
			-- upvalues: List (ref), Connection (upval)
			for _, value in List do
				Connection.Disconnect(value)
			end
		end
	end, {})
	
	return UseStateResult
end