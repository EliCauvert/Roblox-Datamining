local parent = script:FindFirstAncestor("Localization").Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local robloxLocaleIdKeyModule = require(script.Parent.RobloxLocaleIdKey)
local localizationRoactContextModule = require(script.Parent.LocalizationRoactContext)
local localizeStringsModule = require(script.Parent.localizeStrings)
local localizationConsumer = reactModule.Component:extend("LocalizationConsumer")

function localizationConsumer.init(p0) --[[ line: 14 ]]
	-- upvalues: localizationService (ref)
	local localization = p0.props.localization
	
	if localization == nil then
		error("LocalizationConsumer must be below a LocalizationProvider.")
	end
	p0.state = { locale = localizationService.RobloxLocaleId }
	
	function p0.updateLocalization(_) --[[ line: 25 ]]
		-- upvalues: localization (ref), p0 (ref)
		local locale = localization:GetLocale()
		
		if locale ~= p0.state.locale then
			p0:setState({ locale = locale })
		end
	end
	
	p0.connections = { localization.changed:connect(p0.updateLocalization) }
end

function localizationConsumer.willUnmount(p1) --[[ line: 39 ]]
	for i, v in pairs(p1.connections) do
		v:disconnect()
	end
end

function localizationConsumer.render(p2) --[[ line: 45 ]]
	-- upvalues: argCheckModule (ref), localizeStringsModule (ref), robloxLocaleIdKeyModule (ref)
	local localization = p2.props.localization
	local render = p2.props.render
	local stringsToBeLocalized = p2.props.stringsToBeLocalized
	argCheckModule.isType(render, "function", "LocalizationConsumer.props.render")
	argCheckModule.isType(stringsToBeLocalized, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local var8 = localizeStringsModule(localization, stringsToBeLocalized)
	var8[robloxLocaleIdKeyModule] = p2.state.locale
	
	return render(var8)
end

return function(p3) --[[ line: 60 | named "LocalizationContextConsumer" ]]
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationConsumer (ref)
	return reactModule.createElement(localizationRoactContextModule.Consumer, {
		render = function(p4) --[[ line: 62 ]]
			-- upvalues: reactModule (copy), localizationConsumer (copy), p3 (ref)
			return reactModule.createElement(localizationConsumer, {
				localization = p4,
				render = p3.render,
				stringsToBeLocalized = p3.stringsToBeLocalized
			})
		end
	})
end