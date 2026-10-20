local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.MessageComposer)
local _ = require(script.Parent.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)
local StorySupportModule = {
	noopDelivery = { sendMessageDraft = function(_) end },
	draftLabel = function(p1): string
		-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy)
		local List = {}
		
		for _, content in p1.contents do
			local Draft = PlainTextContentModelModule.getDraft(content)
			
			if Draft then
				table.insert(List, `plainText "{Draft.text}"`)
			end
			local Draft1 = PresetContentModelModule.getDraft(content)
			
			if Draft1 then
				table.insert(List, `preset "{Draft1.presetId}" "{Draft1.displayText}"`)
			end
		end
		return if #List == 0 then "(no content)" else table.concat(List, ", ")
	end,
	useEventLog = function()
		-- upvalues: ReactModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState({})
		
		return UseStateResult, (ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl)
				-- upvalues: p2 (copy)
				local Copy = table.clone(Tbl)
				table.insert(Copy, p2)
				
				return Copy
			end)
		end, {}))
	end
}

function StorySupportModule.useDeliveryLog()
	-- upvalues: StorySupportModule (copy), ReactModule (copy)
	local UseEventLogResult, UseEventLogResult2 = StorySupportModule.useEventLog()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseEventLogResult2 (copy), StorySupportModule (upval)
		UseEventLogResult2(`sent: {StorySupportModule.draftLabel(p2)}`)
	end, { UseEventLogResult2 })
	
	return {
		messageDelivery = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy)
			return { sendMessageDraft = UseResult }
		end, { UseResult }),
		entries = UseEventLogResult
	}
end

function StorySupportModule.LogPanel(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local Elements = {}
	local LayoutOrder = 0
	local Header = Frame.header or {}
	for i, Text in Header do
		LayoutOrder += 1
		Elements[`header-{i}`] = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
			Text = Text,
			LayoutOrder = LayoutOrder
		})
	end
	if #Frame.lines == 0 then
		Elements.empty = ReactModule.createElement(FoundationModule.Text, {
			tag = "content-muted size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
			Text = Frame.emptyText,
			LayoutOrder = LayoutOrder + 1
		})
	else
		for i1, line in Frame.lines do
			LayoutOrder += 1
			Elements[`line-{i1}`] = ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap text-align-x-left text-caption-medium",
				Text = line,
				LayoutOrder = LayoutOrder
			})
		end
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.fromOffset(300, 0),
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end

function StorySupportModule.Layout(p2)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "row gap-large auto-xy" }, {
		composerColumn = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-medium auto-y",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(400, 0)
		}, {
			toolbar = if p2.toolbar then ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, p2.toolbar) else nil,
			composer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, p2.composer)
		}),
		panel = if p2.panel then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, p2.panel) else nil
	})
end

return StorySupportModule