local parent = script:FindFirstAncestor("SocialCarousel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local view = foundationModule.View
local text = foundationModule.Text
local marqueeTextMotionModule = require(script.Parent.MarqueeTextMotion)

local function renderCopy(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "auto-y text-align-x-left content-default",
		Text = p1,
		fontStyle = p2,
		TextTruncate = Enum.TextTruncate.None,
		Size = UDim2.fromOffset(p4, 0),
		Position = UDim2.fromOffset(p3, 0)
	})
end

return function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), marqueeTextMotionModule (ref), reactModule (ref), view (ref), renderCopy (ref), text (ref)
	local var1 = usePreferences()
	local fontStyle = p1.fontStyle or useTokens().Typography.LabelSmall
	local var2 = if p1.speed ~= nil then marqueeTextMotionModule.DEFAULT_SPEED else p1.speed
	local var3 = if p1.maxLoops ~= nil then marqueeTextMotionModule.DEFAULT_MAX_LOOPS else p1.maxLoops
	local var4 = p1.isActive == nil or p1.isActive
	local var5 = if p1.reducedMotion ~= nil then var1.reducedMotion else p1.reducedMotion
	local direction = p1.direction or marqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId)
	local heartbeat = p1.heartbeat or game:GetService("RunService").Heartbeat
	local var6, var7 = reactModule.useState(0)
	local var8, var9 = reactModule.useState(0)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useBinding(0)
	local var14 = reactModule.useRef(0)
	local var15 = reactModule.useRef(false)
	local var16 = marqueeTextMotionModule.travelDistance(var6, var8)
	local var17 = var4 and (not var5 and (not var10 and var16 > 0))
	local var18 = not var17 and marqueeTextMotionModule.overflows(var6, var8)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var15 (ref), var13 (ref), var11 (ref)
		var14.current = 0
		var15.current = false
		var13(0)
		var11(false)
	end, { p1.text, var3, var5 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), marqueeTextMotionModule (copy), var12 (ref), var14 (ref), var16 (ref), var2 (ref), var3 (ref), var15 (ref), var13 (ref), var11 (ref), p1 (ref)
		if not var17 then return end
		local var20 = marqueeTextMotionModule.advance({
			finished = false,
			offset = var12:getValue(),
			loopsCompleted = var14.current
		}, var16, var2, p2, var3)
		var14.current = var20.loopsCompleted
		
		if var20.finished then
			if var15.current then return end
			var15.current = true
			var13(0)
			var11(true)
			
			if p1.onFinished then
				p1.onFinished()
				
				return
			end
		else
			var13(var20.offset)
		end
	end, {
		var17, var16, var2, var3, p1.onFinished, var12
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), heartbeat (ref), var19 (ref)
		if var17 then
			local var20 = heartbeat:Connect(var19)
			
			return function()
				-- upvalues: var20 (ref)
				var20:Disconnect()
			end
		end
		return function() end
	end, { var17, heartbeat, var19 })
	local var20 = direction == Enum.TextDirection.RightToLeft
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y clip",
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var9 (ref)
			var9(value.AbsoluteSize.X)
		end
	}, {
		Measure = reactModule.createElement(text, {
			TextTransparency = 1,
			tag = "size-0 auto-x",
			Text = p1.text,
			fontStyle = fontStyle,
			TextTruncate = Enum.TextTruncate.None,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var7 (ref)
				var7(value.AbsoluteSize.X)
			end
		}),
		Content = if var17 then reactModule.createElement(view, {
			tag = "auto-y no-clip",
			Size = UDim2.fromOffset(var16 + var6, 0),
			AnchorPoint = if var20 then Vector2.new(1, 0) else Vector2.new(0, 0),
			Position = var12:map(function(p2)
				-- upvalues: var17 (ref), marqueeTextMotionModule (copy), direction (ref), var20 (ref)
				if not var17 then
					return UDim2.fromOffset(0, 0)
				end
				local var21 = marqueeTextMotionModule.signedOffset(p2, direction)
				
				return if var20 then UDim2.new(1, var21, 0, 0) else UDim2.fromOffset(var21, 0)
			end)
		}, {
			Leading = renderCopy(p1.text, fontStyle, if var20 then var16 else 0, var6),
			Trailing = renderCopy(p1.text, fontStyle, if var20 then 0 else var16, var6)
		}) else reactModule.createElement(text, {
			testId = "marquee-text",
			Text = p1.text,
			fontStyle = fontStyle,
			TextTruncate = if var18 then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
			tag = {
				["size-full-0 auto-y text-align-x-left text-truncate-end content-default"] = var18 and not var20,
				["size-full-0 auto-y text-align-x-left content-default"] = not var18 and not var20,
				["size-full-0 auto-y text-align-x-right text-truncate-end content-default"] = var18 and var20,
				["size-full-0 auto-y text-align-x-right content-default"] = not var18 and var20
			}
		})
	})
end