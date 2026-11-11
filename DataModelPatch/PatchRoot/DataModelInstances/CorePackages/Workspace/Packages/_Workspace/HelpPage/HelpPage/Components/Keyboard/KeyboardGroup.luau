local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Configs.ConfigTypes)
local KeyboardActionModule = require(script.Parent.KeyboardAction)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local MemoResult = ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col align-y-center align-x-left size-full-0 auto-y padding-x-small padding-y-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ReactModule.createElement(Text, {
			tag = "text-title-medium text-align-x-left auto-xy text-wrap",
			key = "title-text",
			textStyle = UseTokensFunction().Color.Extended.White.White_100,
			Text = UseLocalizationFunction({ title = Frame.title }).title
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), MemoResult (copy), KeyboardActionModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "col align-y-top align-x-center size-full gap-xxsmall",
		testId = "KeyboardGroup",
		LayoutOrder = p1.group.layoutOrder
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), MemoResult (upval), p1 (copy), KeyboardActionModule (upval)
		local Elements = {}
		table.insert(Elements, ReactModule.createElement(MemoResult, {
			LayoutOrder = 0,
			title = p1.group.label,
			key = "groupTitle-" .. p1.group.id
		}))
		
		for _, control in p1.controls do
			if control.keyboardInput ~= nil then
				table.insert(Elements, (ReactModule.createElement(KeyboardActionModule, {
					control = control,
					LayoutOrder = control.keyboardInput.layoutOrder,
					key = control.label .. control.keyboardInput.layoutOrder
				})))
			end
		end
		return Elements
	end, { p1.controls, p1.group })))
end)