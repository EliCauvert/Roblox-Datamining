local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local text = require(parent_1.Foundation).Text
local escapeRichTextModule = require(parent.Utils.escapeRichText)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), escapeRichTextModule (ref), reactModule (ref), text (ref)
	local actionLabels = p1.actionLabels
	local t = {}
	
	for i, v in ipairs(actionLabels) do
		t[tostring(i)] = v.label
	end
	t.genericAction = "InGame.HelpMenu.GenericAction"
	local var1 = useLocalization(t)
	local t_1 = {}
	
	for i_1, v_1 in ipairs(actionLabels) do
		local var2 = var1[tostring(i_1)]
		
		if var2 == nil or var2 == "" then
			var2 = var1.genericAction
		end
		var2 = escapeRichTextModule(var2)
		
		if v_1.disabled then
			var2 = "<font transparency=\"0.5\">" .. var5 .. "</font>"
		end
		table.insert(t_1, var2)
	end
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-title-large text-wrap",
		RichText = true,
		Text = table.concat(t_1, " / "),
		TextXAlignment = p1.textXAlignment or Enum.TextXAlignment.Center,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end)