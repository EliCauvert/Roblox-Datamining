local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local LocalizeStringsFunction = LocalizationModule.localizeStrings

return function()
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), LocalizeStringsFunction (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	
	return ReactModule.useCallback(function(Value)
		-- upvalues: UseContextResult (copy), LocalizeStringsFunction (upval)
		if UseContextResult == nil then
			return ""
		else
			local Success, Result = pcall(function()
				-- upvalues: LocalizeStringsFunction (upval), UseContextResult (upval), Value (copy)
				return LocalizeStringsFunction(UseContextResult, { value = Value }).value
			end)
			
			return if Success and typeof(Result) == "string" then Result else ""
		end
	end, { UseContextResult })
end