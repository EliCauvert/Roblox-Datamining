local RunService = game:GetService("RunService")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local EscapeRichTextModule = require(Moments.Utils.escapeRichText)
local TruncateCommentTextModule = require(script.Parent.truncateCommentText)
local IsPointInGuiObjectBoundsFunction = FoundationModule.Utility.isPointInGuiObjectBounds
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	showMore = "Feature.Moments.Action.CommentShowMore",
	showLess = "Feature.Moments.Action.CommentShowLess"
}

return function(Text: string, p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), EscapeRichTextModule (copy), TruncateCommentTextModule (copy), RunService (copy), IsPointInGuiObjectBoundsFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local ShowMore = UseLocalizationResult.showMore
	local ShowLess = UseLocalizationResult.showLess
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), EscapeRichTextModule (upval), ShowMore (copy), ShowLess (copy)
		local Muted = UseTokensResult.Color.Content.Muted
		
		local function _(p2): string
			-- upvalues: EscapeRichTextModule (upval), Muted (copy)
			return `<font color="#{Muted.Color3:ToHex()}" transparency="{Muted.Transparency}"><b>{EscapeRichTextModule(p2)}</b></font>`
		end
		
		return {
			showMoreSuffix = `… {`<font color="#{Muted.Color3:ToHex()}" transparency="{Muted.Transparency}"><b>{EscapeRichTextModule(ShowMore)}</b></font>`}`,
			showLess = `<font color="#{Muted.Color3:ToHex()}" transparency="{Muted.Transparency}"><b>{EscapeRichTextModule(ShowLess)}</b></font>`
		}
	end, { UseTokensResult, ShowMore, ShowLess })
	local ShowMoreSuffix = UseMemoResult.showMoreSuffix
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local CollapsedText = if UseStateResult == nil or UseStateResult.text ~= Text or UseStateResult.suffix ~= ShowMoreSuffix then nil else UseStateResult.collapsedText
	local HasCollapsedText = CollapsedText ~= nil
	local EscapeRichTextModuleResult = if CollapsedText == nil then EscapeRichTextModule(Text) elseif p1 then `{EscapeRichTextModule((string.gsub(Text, "%s+$", "")))} {UseMemoResult.showLess}` else CollapsedText
	local Current = {
		text = Text,
		suffix = ShowMoreSuffix,
		clampedBodyText = if p1 and HasCollapsedText then nil else EscapeRichTextModuleResult
	}
	local UseRefResult4 = ReactModule.useRef(Current)
	UseRefResult4.current = Current
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy), TruncateCommentTextModule (upval)
		local Current = UseRefResult1.current
		
		if Current == nil or not Current:IsDescendantOf(game) or Current.AbsoluteSize.X <= 0 then return end
		local function measure(Text)
			-- upvalues: Current (copy)
			Current.Text = Text
			
			return Current.TextBounds.Y
		end
		
		Current.Text = "M\nM\nM"
		local NewY = Current.TextBounds.Y + 1
		local Current1 = UseRefResult4.current
		local Text: string = `{Current.AbsoluteSize.X}|{NewY}|{Current1.suffix}|{Current1.text}`
		
		if Text ~= UseRefResult2.current then
			UseRefResult2.current = Text
			UseRefResult3.current = NewY
			UseStateResult2({
				text = Current1.text,
				suffix = Current1.suffix,
				collapsedText = TruncateCommentTextModule(Current1.text, Current1.suffix, NewY, measure)
			})
		end
		Current.Text = "M\nM\nM"
	end, {})
	local UseRefResult5 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult5 (copy), RunService (upval), UseRefResult (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseResult (copy)
		if not UseRefResult5.current then
			UseRefResult5.current = true
			RunService.Heartbeat:Once(function()
				-- upvalues: UseRefResult5 (upval), UseRefResult (upval), UseRefResult3 (upval), UseRefResult4 (upval), UseRefResult2 (upval), UseResult (upval)
				UseRefResult5.current = false
				local Current = UseRefResult.current
				local Current1 = UseRefResult3.current
				
				if Current ~= nil and Current1 ~= nil and Current.Text == UseRefResult4.current.clampedBodyText and Current1 < Current.TextBounds.Y then
					UseRefResult2.current = nil
				end
				UseResult()
			end)
			
			return
		end
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(_)
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseResult1 (copy)
		local Current = UseRefResult1.current
		
		if Current == nil then
			return nil
		else
			local AncestryChangedConnection = Current.AncestryChanged:Connect(function()
				-- upvalues: Current (copy), UseResult1 (upval)
				if Current:IsDescendantOf(game) then
					UseResult1()
				end
			end)
			
			return function()
				-- upvalues: AncestryChangedConnection (copy)
				AncestryChangedConnection:Disconnect()
			end
		end
	end, { UseResult1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult, Text, ShowMoreSuffix })
	
	return {
		bodyText = EscapeRichTextModuleResult,
		bodyRef = UseRefResult,
		measureRef = UseRefResult1,
		onBodyAbsoluteSizeChanged = UseResult2,
		isTruncatable = HasCollapsedText,
		containsPoint = ReactModule.useCallback(function(p2)
			-- upvalues: IsPointInGuiObjectBoundsFunction (upval), UseRefResult (copy)
			return IsPointInGuiObjectBoundsFunction(UseRefResult.current, p2)
		end, {})
	}
end