local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal
local guiService = wrappersModule.Services.GuiService
local userInputService = wrappersModule.Services.UserInputService

local function getGuiInset()
	-- upvalues: guiService (ref)
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	
	return Rect.new(guiInset, guiInset_1)
end

return function()
	-- upvalues: reactModule (ref), getGuiInset (ref), isPluginSecurityModule (ref), signal (ref), guiService (ref), instance (ref), userInputService (ref), connection (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: getGuiInset (copy)
		return getGuiInset()
	end)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), getGuiInset (copy)
		var2(getGuiInset())
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPluginSecurityModule (copy), signal (copy), guiService (copy), var3 (ref), instance (copy), userInputService (copy), connection (copy)
		local var4 = if isPluginSecurityModule() then {
			signal.Connect(guiService.SafeZoneOffsetsChanged, var3),
			signal.Connect(instance.GetPropertyChangedSignal(userInputService, "BottomBarSize"), var3),
			signal.Connect(instance.GetPropertyChangedSignal(userInputService, "RightBarSize"), var3)
		} else {}
		
		return function()
			-- upvalues: var4 (write), connection (copy)
			for i, v in var4 do
				connection.Disconnect(v)
			end
		end
	end, {})
	
	return var1
end