local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.MessageComposer)
local _ = require(script.Parent.Parent.Types)
local plainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local presetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)
local t = {
	noopDelivery = { sendMessageDraft = function(_) end },
	draftLabel = function(p1)
		-- upvalues: plainTextContentModelModule (ref), presetContentModelModule (ref)
		local t = {}
		
		for i, v in p1.contents do
			local draft = plainTextContentModelModule.getDraft(v)
			
			if draft then
				table.insert(t, `plainText "{draft.text}"`)
			end
			local draft_1 = presetContentModelModule.getDraft(v)
			
			if draft_1 then
				table.insert(t, `preset "{draft_1.presetId}" "{draft_1.displayText}"`)
			end
		end
		return if #t == 0 then "(no content)" else table.concat(t, ", ")
	end,
	useEventLog = function()
		-- upvalues: reactModule (ref)
		local var1, var2 = reactModule.useState({})
		
		return var1, reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			var2(function(p3)
				-- upvalues: p2 (ref)
				local cloned = table.clone(p3)
				table.insert(cloned, p2)
				
				return cloned
			end)
		end, {})
	end
}

function t.useDeliveryLog()
	-- upvalues: t (ref), reactModule (ref)
	local var1, var2 = t.useEventLog()
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), t (copy)
		var2(`sent: {t.draftLabel(p2)}`)
	end, { var2 })
	
	return {
		messageDelivery = reactModule.useMemo(function()
			-- upvalues: var3 (ref)
			return { sendMessageDraft = var3 }
		end, { var3 }),
		entries = var1
	}
end

function t.LogPanel(p2)
	-- upvalues: reactModule (ref), foundationModule (ref)
	local t = {}
	local var1 = 0
	
	for i, v in p2.header or {} do
		var1 += 1
		t[`header-{i}`] = reactModule.createElement(foundationModule.Text, {
			tag = "size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
			Text = v,
			LayoutOrder = var1
		})
	end
	if #p2.lines == 0 then
		t.empty = reactModule.createElement(foundationModule.Text, {
			tag = "content-muted size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
			Text = p2.emptyText,
			LayoutOrder = var1 + 1
		})
	else
		for i_1, v_1 in p2.lines do
			var1 += 1
			t[`line-{i_1}`] = reactModule.createElement(foundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
				Text = v_1,
				LayoutOrder = var1
			})
		end
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.fromOffset(300, 0),
		LayoutOrder = p2.LayoutOrder
	}, t)
end

function t.Layout(p3)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, { tag = "row gap-large auto-xy" }, {
		composerColumn = reactModule.createElement(foundationModule.View, {
			tag = "col gap-medium auto-y",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(400, 0)
		}, {
			toolbar = if p3.toolbar then reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, p3.toolbar) else nil,
			composer = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, p3.composer)
		}),
		panel = if p3.panel then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, p3.panel) else nil
	})
end

return t