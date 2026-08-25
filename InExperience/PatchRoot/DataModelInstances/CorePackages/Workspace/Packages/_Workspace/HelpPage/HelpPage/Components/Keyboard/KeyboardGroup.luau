local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local _ = require(parent.Configs.ConfigTypes)
local localizationModule = require(parent_1.Localization)
local keyboardActionModule = require(script.Parent.KeyboardAction)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local var4 = reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-y-center align-x-left size-full-0 auto-y padding-x-small padding-y-small",
		LayoutOrder = p0.LayoutOrder
	}, {
		reactModule.createElement(text, {
			tag = "text-title-medium text-align-x-left auto-xy text-wrap",
			key = "title-text",
			textStyle = useTokens().Color.Extended.White.White_100,
			Text = useLocalization({ title = p0.title }).title
		})
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), var4 (ref), keyboardActionModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "col align-y-top align-x-center size-full gap-xxsmall",
		testId = "KeyboardGroup",
		LayoutOrder = p1.group.layoutOrder
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var4 (copy), p1 (ref), keyboardActionModule (copy)
		local t = {}
		table.insert(t, reactModule.createElement(var4, {
			LayoutOrder = 0,
			title = p1.group.label,
			key = "groupTitle-" .. p1.group.id
		}))
		
		for i, v in p1.controls do
			if v.keyboardInput ~= nil then
				table.insert(t, reactModule.createElement(keyboardActionModule, {
					control = v,
					LayoutOrder = v.keyboardInput.layoutOrder,
					key = v.label .. v.keyboardInput.layoutOrder
				}))
			end
		end
		return t
	end, { p1.controls, p1.group }))
end)