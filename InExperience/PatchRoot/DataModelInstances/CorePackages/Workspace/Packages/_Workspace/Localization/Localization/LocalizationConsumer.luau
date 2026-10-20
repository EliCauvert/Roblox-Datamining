local Parent = script:FindFirstAncestor("Localization").Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local RobloxLocaleIdKeyModule = require(script.Parent.RobloxLocaleIdKey)
local LocalizationRoactContextModule = require(script.Parent.LocalizationRoactContext)
local LocalizeStringsModule = require(script.Parent.localizeStrings)
local LocalizationConsumer = ReactModule.Component:extend("LocalizationConsumer")

function LocalizationConsumer.init(p1)
	-- upvalues: LocalizationService (copy)
	local Localization = p1.props.localization
	
	if Localization == nil then
		error("LocalizationConsumer must be below a LocalizationProvider.")
	end
	p1.state = { locale = LocalizationService.RobloxLocaleId }
	
	function p1:updateLocalization()
		-- upvalues: Localization (copy), p1 (copy)
		local Locale = Localization:GetLocale()
		
		if Locale ~= p1.state.locale then
			p1:setState({ locale = Locale })
		end
	end
	
	p1.connections = { Localization.changed:connect(p1.updateLocalization) }
end

function LocalizationConsumer.willUnmount(p1)
	for _, connection in pairs(p1.connections) do
		connection:disconnect()
	end
end

function LocalizationConsumer.render(p2)
	-- upvalues: ArgCheckModule (copy), LocalizeStringsModule (copy), RobloxLocaleIdKeyModule (copy)
	local Localization = p2.props.localization
	local RenderFunction = p2.props.render
	local StringsToBeLocalized = p2.props.stringsToBeLocalized
	ArgCheckModule.isType(RenderFunction, "function", "LocalizationConsumer.props.render")
	ArgCheckModule.isType(StringsToBeLocalized, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local LocalizeStringsModuleResult = LocalizeStringsModule(Localization, StringsToBeLocalized)
	LocalizeStringsModuleResult[RobloxLocaleIdKeyModule] = p2.state.locale
	
	return RenderFunction(LocalizeStringsModuleResult)
end

return function(p2)
	-- upvalues: ReactModule (copy), LocalizationRoactContextModule (copy), LocalizationConsumer (copy)
	return ReactModule.createElement(LocalizationRoactContextModule.Consumer, {
		render = function(Localization)
			-- upvalues: ReactModule (upval), LocalizationConsumer (upval), p2 (copy)
			return ReactModule.createElement(LocalizationConsumer, {
				localization = Localization,
				render = p2.render,
				stringsToBeLocalized = p2.stringsToBeLocalized
			})
		end
	})
end