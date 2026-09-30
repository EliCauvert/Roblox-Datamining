local runService = game:GetService("RunService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local escapeRichTextModule = require(moments.Utils.escapeRichText)
local truncateCommentTextModule = require(script.Parent.truncateCommentText)
local isPointInGuiObjectBounds = foundationModule.Utility.isPointInGuiObjectBounds
local useTokens = foundationModule.Hooks.useTokens

return function(value, minValue)
	-- upvalues: useTokens (ref), reactModule (ref), escapeRichTextModule (ref), truncateCommentTextModule (ref), runService (ref), isPointInGuiObjectBounds (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		local muted = var1.Color.Content.Muted
		
		local function _(p1)
			-- upvalues: muted (ref)
			return `<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>{p1}</b></font>`
		end
		
		return {
			showMoreSuffix = `\226\128\166 {`<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>Show more</b></font>`}`,
			showLess = `<font color="#{muted.Color3:ToHex()}" transparency="{muted.Transparency}"><b>Show less</b></font>`
		}
	end, { var1 })
	local showMoreSuffix = var2.showMoreSuffix
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useState(nil)
	local var9 = if var7 == nil or var7.text ~= value or var7.suffix ~= showMoreSuffix then nil else var7.collapsedText
	local var10 = var9 ~= nil
	local var11 = if var9 == nil then escapeRichTextModule(value) elseif minValue then `{escapeRichTextModule(string.gsub(value, "%s+$", ""))} {var2.showLess}` else var9
	local t = {
		text = value,
		suffix = showMoreSuffix,
		clampedBodyText = if minValue and var10 then nil else var11
	}
	local var12 = reactModule.useRef(t)
	var12.current = t
	local var13 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var12 (ref), var5 (ref), var6 (ref), var8 (ref), truncateCommentTextModule (copy)
		local current = var4.current
		
		if current == nil or not current:IsDescendantOf(game) or current.AbsoluteSize.X <= 0 then return end
		local function measure(p1)
			-- upvalues: current (ref)
			current.Text = p1
			
			return current.TextBounds.Y
		end
		
		current.Text = "M\nM\nM"
		local var14 = current.TextBounds.Y + 1
		local current_1 = var12.current
		local x = `{current.AbsoluteSize.X}|{var14}|{current_1.suffix}|{current_1.text}`
		
		if x ~= var5.current then
			var5.current = x
			var6.current = var14
			var8({
				text = current_1.text,
				suffix = current_1.suffix,
				collapsedText = truncateCommentTextModule(current_1.text, current_1.suffix, var14, measure)
			})
		end
		current.Text = "M\nM\nM"
	end, {})
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), runService (copy), var3 (ref), var6 (ref), var12 (ref), var5 (ref), var13 (ref)
		if var14.current then
			return
		end
		var14.current = true
		runService.Heartbeat:Once(function()
			-- upvalues: var14 (copy), var3 (copy), var6 (copy), var12 (copy), var5 (copy), var13 (copy)
			var14.current = false
			local current = var3.current
			local current_1 = var6.current
			
			if current ~= nil and current_1 ~= nil and (current.Text == var12.current.clampedBodyText and current_1 < current.TextBounds.Y) then
				var5.current = nil
			end
			var13()
		end)
	end, { var13 })
	local var16 = reactModule.useCallback(function(_)
		-- upvalues: var15 (ref)
		var15()
	end, { var15 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var15 (ref)
		local current = var4.current
		
		if current == nil then
			return nil
		end
		local ancestryChangedConnection = current.AncestryChanged:Connect(function()
			-- upvalues: current (ref), var15 (copy)
			if current:IsDescendantOf(game) then
				var15()
			end
		end)
		
		return function()
			-- upvalues: ancestryChangedConnection (ref)
			ancestryChangedConnection:Disconnect()
		end
	end, { var15 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref)
		var13()
	end, { var13, value, showMoreSuffix })
	
	return {
		bodyText = var11,
		bodyRef = var3,
		measureRef = var4,
		onBodyAbsoluteSizeChanged = var16,
		isTruncatable = var10,
		containsPoint = reactModule.useCallback(function(p1)
			-- upvalues: isPointInGuiObjectBounds (copy), var3 (ref)
			return isPointInGuiObjectBounds(var3.current, p1)
		end, {})
	}
end