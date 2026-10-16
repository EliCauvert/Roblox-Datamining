local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.MessageComposer)
local _ = require(script.Parent.Parent.Types)
local t = {
	noopDelivery = {
		sendMessageDraft = function(_)
			return { accepted = false }
		end,
		onMessageDeliveryReceipt = function(_) end
	},
	draftLabel = function(p1)
		local t = {}
		
		for i, v in p1.contents do
			local plainText = v.plainText
			
			if plainText then
				table.insert(t, `plainText "{plainText.text}"`)
			end
		end
		return if #t == 0 then "(no plainText content)" else table.concat(t, ", ")
	end,
	receiptLabel = function(p2)
		return if p2.accepted then `Last receipt: accepted {p2.messageId}` else "Last receipt: rejected"
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

function t.useDeliveryLog(p2)
	-- upvalues: t (ref), reactModule (ref)
	local var1, var2 = t.useEventLog()
	local var3, var4 = reactModule.useState("Last receipt: none yet")
	local var5 = reactModule.useRef(1)
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: t (copy), p2 (ref), var5 (ref), var2 (ref)
		local var7 = t.draftLabel(p3)
		
		if p2 then
			local var8 = tostring(var5.current)
			var5.current += 1
			var2(`accepted {var8}: {var7}`)
			
			return { accepted = true, messageId = var8 }
		end
		var2(`rejected: {var7}`)
		
		return { accepted = false }
	end, { p2, var2 })
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), t (copy)
		var4(t.receiptLabel(p3))
	end, {})
	
	return {
		messageDelivery = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var7 (ref)
			return {
				sendMessageDraft = var6,
				onMessageDeliveryReceipt = var7
			}
		end, { var6, var7 }),
		entries = var1,
		lastReceipt = var3
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