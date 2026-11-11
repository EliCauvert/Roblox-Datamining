local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.MetadataSize)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local MetadataItemModule = require(script.Parent.MetadataItem)
local _ = require(script.Parent.useMetadataVariants)
local UseTruncationFallbackModule = require(script.Parent.useTruncationFallback)

return function(p1)
	-- upvalues: ReactModule (copy), UseTextSizeOffsetModule (copy), UseTruncationFallbackModule (copy), TextModule (copy), MetadataItemModule (copy)
	local CountItems = #p1.items
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), CountItems (copy)
		local config = { [p1.truncateIndex] = 0 }
		local Count = 1
		
		for i = 1, CountItems do
			if i ~= p1.truncateIndex then
				config[i] = Count
				Count += 1
			end
		end
		return config
	end, { CountItems, p1.truncateIndex })
	local UseTextSizeOffsetModuleResult = UseTextSizeOffsetModule()
	local UseTruncationFallbackModuleResult = UseTruncationFallbackModule(ReactModule.useMemo(function(): string
		-- upvalues: p1 (copy), UseTextSizeOffsetModuleResult (copy)
		local List = {}
		
		for _, item in p1.items do
			local Leading = item.leading
			table.insert(List, `{if Leading == nil then "" elseif type(Leading) == "string" then "icon" else Leading.type}:{item.text}`)
		end
		return table.concat({
			tostring(p1.truncateIndex), p1.size, tostring(p1.hasSeparator),
			tostring(p1.trailing ~= nil), tostring(UseTextSizeOffsetModuleResult),
			table.concat(List, "\0")
		}, "|")
	end, {
		p1.items, p1.truncateIndex, p1.size, p1.hasSeparator, p1.trailing,
		UseTextSizeOffsetModuleResult
	}), CountItems, p1.variantProps.text.fontStyle)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: CountItems (copy), UseTruncationFallbackModuleResult (copy)
		local t = {}
		
		for i = 0, CountItems - 1 do
			t[i] = function(p2)
				-- upvalues: UseTruncationFallbackModuleResult (upval), i (copy)
				UseTruncationFallbackModuleResult.onSizeChanged(i, p2)
			end
			
		end
		return t
	end, {
		CountItems,
		UseTruncationFallbackModuleResult.onSizeChanged
	})
	local Elements = {}
	
	for Index, item in p1.items do
		local UseMemoResultEntry = UseMemoResult[Index]
		local ShrinkRatio = UseTruncationFallbackModuleResult.getShrinkRatio(UseMemoResultEntry)
		
		if Index > 1 and p1.hasSeparator then
			Elements[`Separator{Index - 1}`] = ReactModule.createElement(TextModule, {
				Text = "·",
				tag = p1.variantProps.text.tag,
				LayoutOrder = Index * 2 - 1,
				testId = `{p1.testId}--separator-{Index - 1}`
			})
		end
		local HasShrinkRatio: boolean = CountItems > 1 and ShrinkRatio ~= nil
		Elements[`Item{Index}`] = ReactModule.createElement(MetadataItemModule, {
			index = Index,
			text = item.text,
			leading = item.leading,
			trailing = if Index == CountItems then p1.trailing else nil,
			variantProps = p1.variantProps,
			isWrapped = p1.maxLines > 1,
			textHeight = p1.textHeight,
			shrinkRatio = ShrinkRatio,
			minTextWidth = if HasShrinkRatio and UseTruncationFallbackModuleResult.isPinned(UseMemoResultEntry) then UseTruncationFallbackModuleResult.minWidth else nil,
			onTextSizeChanged = if HasShrinkRatio and UseTruncationFallbackModuleResult.isDeciding(UseMemoResultEntry) then UseMemoResult1[UseMemoResultEntry] else nil,
			LayoutOrder = Index * 2,
			testId = p1.testId
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end