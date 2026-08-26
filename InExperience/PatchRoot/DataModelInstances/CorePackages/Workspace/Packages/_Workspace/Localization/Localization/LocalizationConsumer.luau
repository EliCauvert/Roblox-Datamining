local parent = script:FindFirstAncestor("Localization").Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local robloxLocaleIdKeyModule = require(script.Parent.RobloxLocaleIdKey)
local localizationRoactContextModule = require(script.Parent.LocalizationRoactContext)
local localizeStringsModule = require(script.Parent.localizeStrings)
local localizationConsumer = reactModule.Component:extend("LocalizationConsumer")

function localizationConsumer.init(p1)
	-- upvalues: localizationService (ref)
	local localization = p1.props.localization
	
	if localization == nil then
		error("LocalizationConsumer must be below a LocalizationProvider.")
	end
	p1.state = { locale = localizationService.RobloxLocaleId }
	
	function p0.updateLocalization(_)
		-- upvalues: localization (ref), p1 (ref)
		local locale = localization:GetLocale()
		
		if locale ~= p1.state.locale then
			p1:setState({ locale = locale })
		end
	end
	
	p1.connections = { localization.changed:connect(p1.updateLocalization) }
end

function localizationConsumer.willUnmount(p1)
	for i, v in pairs(p1.connections) do
		v:disconnect()
	end
end

function localizationConsumer.render(p2)
	-- upvalues: argCheckModule (ref), localizeStringsModule (ref), robloxLocaleIdKeyModule (ref)
	local localization = p2.props.localization
	local render = p2.props.render
	local stringsToBeLocalized = p2.props.stringsToBeLocalized
	argCheckModule.isType(render, "function", "LocalizationConsumer.props.render")
	argCheckModule.isType(stringsToBeLocalized, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local var1 = localizeStringsModule(localization, stringsToBeLocalized)
	var1[robloxLocaleIdKeyModule] = p2.state.locale
	
	return render(var1)
end

return function(p2)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationConsumer (ref)
	return reactModule.createElement(localizationRoactContextModule.Consumer, {
		render = function(p3)
			-- upvalues: reactModule (copy), localizationConsumer (copy), p2 (ref)
			return reactModule.createElement(localizationConsumer, {
				localization = p3,
				render = p2.render,
				stringsToBeLocalized = p2.stringsToBeLocalized
			})
		end
	})
end