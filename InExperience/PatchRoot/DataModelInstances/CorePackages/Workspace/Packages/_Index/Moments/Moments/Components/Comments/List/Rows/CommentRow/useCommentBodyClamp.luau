local runService = game:GetService("RunService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local escapeRichTextModule = require(moments.Utils.escapeRichText)
local truncateCommentTextModule = require(script.Parent.truncateCommentText)
local isPointInGuiObjectBounds = foundationModule.Utility.isPointInGuiObjectBounds
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	showMore = "Feature.Moments.Action.CommentShowMore",
	showLess = "Feature.Moments.Action.CommentShowLess"
}

return function(value, minValue)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), reactModule (ref), escapeRichTextModule (ref), truncateCommentTextModule (ref), runService (ref), isPointInGuiObjectBounds (ref)
	local var1 = useTokens()
	local var2 = useLocalization(t)
	local showMore = var2.showMore
	local showLess = var2.showLess
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), escapeRichTextModule (copy), showMore (ref), showLess (ref)
		local muted = var1.Color.Content.Muted
		
		local function _(p1)
			-- upvalues: escapeRichTextModule (copy), muted (ref)
			return `<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>{escapeRichTextModule(p1)}</b></font>`
		end
		
		return {
			showMoreSuffix = `\226\128\166 {`<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>{escapeRichTextModule(showMore)}</b></font>`}`,
			showLess = `<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>{escapeRichTextModule(showLess)}</b></font>`
		}
	end, { var1, showMore, showLess })
	local showMoreSuffix = var3.showMoreSuffix
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(nil)
	local var10 = if var8 == nil or var8.text ~= value or var8.suffix ~= showMoreSuffix then nil else var8.collapsedText
	local var11 = var10 ~= nil
	local var12 = if var10 == nil then escapeRichTextModule(value) elseif minValue then `{escapeRichTextModule(string.gsub(value, "%s+$", ""))} {var3.showLess}` else var10
	local t_1 = {
		text = value,
		suffix = showMoreSuffix,
		clampedBodyText = if minValue and var11 then nil else var12
	}
	local var13 = reactModule.useRef(t_1)
	var13.current = t_1
	local var14 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var13 (ref), var6 (ref), var7 (ref), var9 (ref), truncateCommentTextModule (copy)
		local current = var5.current
		
		if current == nil or not current:IsDescendantOf(game) or current.AbsoluteSize.X <= 0 then return end
		local function measure(p1)
			-- upvalues: current (ref)
			current.Text = p1
			
			return current.TextBounds.Y
		end
		
		current.Text = "M\nM\nM"
		local var15 = current.TextBounds.Y + 1
		local current_1 = var13.current
		local x = `{current.AbsoluteSize.X}|{var15}|{current_1.suffix}|{current_1.text}`
		
		if x ~= var6.current then
			var6.current = x
			var7.current = var15
			var9({
				text = current_1.text,
				suffix = current_1.suffix,
				collapsedText = truncateCommentTextModule(current_1.text, current_1.suffix, var15, measure)
			})
		end
		current.Text = "M\nM\nM"
	end, {})
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), runService (copy), var4 (ref), var7 (ref), var13 (ref), var6 (ref), var14 (ref)
		if var15.current then
			return
		end
		var15.current = true
		runService.Heartbeat:Once(function()
			-- upvalues: var15 (copy), var4 (copy), var7 (copy), var13 (copy), var6 (copy), var14 (copy)
			var15.current = false
			local current = var4.current
			local current_1 = var7.current
			
			if current ~= nil and current_1 ~= nil and (current.Text == var13.current.clampedBodyText and current_1 < current.TextBounds.Y) then
				var6.current = nil
			end
			var14()
		end)
	end, { var14 })
	local var17 = reactModule.useCallback(function(_)
		-- upvalues: var16 (ref)
		var16()
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var16 (ref)
		local current = var5.current
		
		if current == nil then
			return nil
		end
		local ancestryChangedConnection = current.AncestryChanged:Connect(function()
			-- upvalues: current (ref), var16 (copy)
			if current:IsDescendantOf(game) then
				var16()
			end
		end)
		
		return function()
			-- upvalues: ancestryChangedConnection (ref)
			ancestryChangedConnection:Disconnect()
		end
	end, { var16 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var14 (ref)
		var14()
	end, { var14, value, showMoreSuffix })
	
	return {
		bodyText = var12,
		bodyRef = var4,
		measureRef = var5,
		onBodyAbsoluteSizeChanged = var17,
		isTruncatable = var11,
		containsPoint = reactModule.useCallback(function(p1)
			-- upvalues: isPointInGuiObjectBounds (copy), var4 (ref)
			return isPointInGuiObjectBounds(var4.current, p1)
		end, {})
	}
end