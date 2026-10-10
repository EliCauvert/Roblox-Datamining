local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local view = foundationModule.View
local text = foundationModule.Text
local marqueeTextMotionModule = require(script.Parent.MarqueeTextMotion)
local marqueePlayStatus = require(socialCarousel.Common.Enums).MarqueePlayStatus

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
	-- upvalues: useTokens (ref), usePreferences (ref), marqueeTextMotionModule (ref), marqueePlayStatus (ref), reactModule (ref), view (ref), renderCopy (ref), text (ref)
	local var1 = usePreferences()
	local fontStyle = p1.fontStyle or useTokens().Typography.LabelSmall
	local var2 = if p1.speed ~= nil then marqueeTextMotionModule.DEFAULT_SPEED else p1.speed
	local var3 = if p1.maxLoops ~= nil then marqueeTextMotionModule.DEFAULT_MAX_LOOPS else p1.maxLoops
	local playStatus = p1.playStatus or marqueePlayStatus.Playing
	local var4 = if p1.reducedMotion ~= nil then var1.reducedMotion else p1.reducedMotion
	local direction = p1.direction or marqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId)
	local heartbeat = p1.heartbeat or game:GetService("RunService").Heartbeat
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(0)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useBinding(0)
	local var13 = reactModule.useRef(0)
	local var14 = reactModule.useRef(false)
	local var15 = marqueeTextMotionModule.travelDistance(var5, var7)
	local var16 = playStatus ~= marqueePlayStatus.Idle and (not var4 and (not var9 and var15 > 0))
	local var17 = var16 and playStatus == marqueePlayStatus.Playing
	local var18 = not var16 and marqueeTextMotionModule.overflows(var5, var7)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var14 (ref), var12 (ref), var10 (ref)
		var13.current = 0
		var14.current = false
		var12(0)
		var10(false)
	end, { p1.text, var3, var4, p1.runId })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), marqueeTextMotionModule (copy), var11 (ref), var13 (ref), var15 (ref), var2 (ref), var3 (ref), var14 (ref), var12 (ref), var10 (ref), p1 (ref)
		if not var17 then return end
		local var20 = marqueeTextMotionModule.advance({
			finished = false,
			offset = var11:getValue(),
			loopsCompleted = var13.current
		}, var15, var2, p2, var3)
		var13.current = var20.loopsCompleted
		
		if var20.finished then
			if var14.current then return end
			var14.current = true
			var12(0)
			var10(true)
			
			if p1.onFinished then
				p1.onFinished()
				
				return
			end
		else
			var12(var20.offset)
		end
	end, {
		var17, var15, var2, var3, p1.onFinished, var11
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
			-- upvalues: var8 (ref)
			var8(value.AbsoluteSize.X)
		end
	}, {
		Measure = reactModule.createElement(text, {
			TextTransparency = 1,
			tag = "size-0 auto-x",
			Text = p1.text,
			fontStyle = fontStyle,
			TextTruncate = Enum.TextTruncate.None,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var6 (ref)
				var6(value.AbsoluteSize.X)
			end
		}),
		Content = if var16 then reactModule.createElement(view, {
			tag = "auto-y no-clip",
			Size = UDim2.fromOffset(var15 + var5, 0),
			AnchorPoint = if var20 then Vector2.new(1, 0) else Vector2.new(0, 0),
			Position = var11:map(function(p2)
				-- upvalues: var16 (ref), marqueeTextMotionModule (copy), direction (ref), var20 (ref)
				if not var16 then
					return UDim2.fromOffset(0, 0)
				end
				local var21 = marqueeTextMotionModule.signedOffset(p2, direction)
				
				return if var20 then UDim2.new(1, var21, 0, 0) else UDim2.fromOffset(var21, 0)
			end)
		}, {
			Leading = renderCopy(p1.text, fontStyle, if var20 then var15 else 0, var5),
			Trailing = renderCopy(p1.text, fontStyle, if var20 then 0 else var15, var5)
		}) else reactModule.createElement(text, {
			testId = "marquee-text",
			Text = p1.text,
			fontStyle = fontStyle,
			TextTruncate = if var18 then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
			tag = {
				["size-full-0 auto-y text-align-x-center text-truncate-end content-default"] = var18,
				["size-full-0 auto-y text-align-x-center content-default"] = not var18
			}
		})
	})
end