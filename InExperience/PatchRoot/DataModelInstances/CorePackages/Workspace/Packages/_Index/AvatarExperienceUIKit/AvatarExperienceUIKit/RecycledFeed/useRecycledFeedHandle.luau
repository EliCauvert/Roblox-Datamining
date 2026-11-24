local TweenService = game:GetService("TweenService")
local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)
local _ = require(script.Parent.RecycledFeedTypes)
local GetUserSettingsModule = require(script.Parent.Parent.Utils.getUserSettings)
local FFlagViewRecyclerReact084Module = require(script.Parent.FFlagViewRecyclerReact084)
local config = { animated = true, frequency = 5, jumpDistance = 2 }
local _TweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

return function(p1, p2, Callback)
	-- upvalues: ReactModule (copy), GetUserSettingsModule (copy), FFlagViewRecyclerReact084Module (copy), config (copy), TweenService (copy), _TweenInfo (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Callback)
	UseRefResult1.current = Callback
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy)
		local Current = UseRefResult3.current
		
		if Current then
			UseRefResult3.current = nil
			Current:Cancel()
			Current:Destroy()
		end
	end, {})
	local UseRefResult4 = ReactModule.useRef({})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy)
		for _, Connection in UseRefResult4.current do
			Connection:Disconnect()
		end
		UseRefResult4.current = {}
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult (copy), UseResult1 (copy), UseRefResult (copy), UseRefResult4 (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		UseResult()
		UseResult1()
		UseRefResult.current = Current
		
		if Current ~= nil then
			UseRefResult4.current = {
				Current.InputBegan:Connect(function(Input)
					-- upvalues: UseResult (upval)
					if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseWheel then
						UseResult()
					end
				end),
				Current.InputChanged:Connect(function(Input)
					-- upvalues: UseResult (upval)
					if Input.UserInputType == Enum.UserInputType.MouseWheel then
						UseResult()
					end
				end)
			}
		end
		local Current1: (any) -> () = if Current == nil then UseRefResult2.current else UseRefResult1.current
		UseRefResult2.current = if Current == nil then nil else Current1
		
		if Current1 then
			Current1(Current)
		end
	end, { UseResult, UseResult1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), Callback (copy)
		local CurrentFunction: (any) -> () = UseRefResult2.current
		local Current = UseRefResult.current
		
		if Current == nil or CurrentFunction == Callback then return end
		UseRefResult2.current = Callback
		
		if CurrentFunction then
			CurrentFunction(nil)
		end
		if Callback then
			Callback(Current)
		end
	end, { Callback })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseResult1 (copy)
		return function()
			-- upvalues: UseResult (upval), UseResult1 (upval)
			UseResult()
			UseResult1()
		end
	end, { UseResult, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(p3: number, p4)
		-- upvalues: UseResult (copy), p1 (copy), UseRefResult (copy), GetUserSettingsModule (upval), FFlagViewRecyclerReact084Module (upval), config (upval), TweenService (upval), _TweenInfo (upval), UseRefResult3 (copy)
		UseResult()
		local Current = p1.current
		local Current1 = UseRefResult.current
		
		if Current == nil then return end
		if p4 and Current1 ~= nil and not GetUserSettingsModule().ReducedMotion then
			if not FFlagViewRecyclerReact084Module then
				local Tween = TweenService:Create(Current1, _TweenInfo, {
					CanvasPosition = Vector2.new(Current1.CanvasPosition.X, Current1.CanvasPosition.Y + p3 - Current.getScrollState().scrollOffset)
				})
				Tween.Completed:Connect(function(PlaybackState)
					-- upvalues: UseRefResult3 (upval), Tween (copy), p1 (upval), p3 (copy)
					if PlaybackState ~= Enum.PlaybackState.Completed or UseRefResult3.current ~= Tween then return end
					UseRefResult3.current = nil
					Tween:Destroy()
					local Current = p1.current
					
					if Current and p3 <= 0 then
						Current.scrollToStart()
						
						return
					end
					if Current then
						Current.scrollToOffset(p3)
					end
				end)
				UseRefResult3.current = Tween
				Tween:Play()
				
				return
			end
			if p3 <= 0 then
				Current.scrollToStart(config)
				
				return
			else
				Current.scrollToOffset(p3, config)
				
				return
			end
		elseif p3 <= 0 then
			Current.scrollToStart()
			
			return
		else
			Current.scrollToOffset(p3)
		end
	end, { UseResult })
	ReactModule.useLayoutEffect(function()
		-- upvalues: p2 (copy), UseResult3 (copy), p1 (copy), UseResult (copy)
		if p2 == nil then
			return nil
		else
			local Current = {
				scrollToOffset = UseResult3,
				captureScrollAnchorSnapshot = function()
					-- upvalues: p1 (upval)
					local Current = p1.current
					
					return if Current then Current.captureScrollAnchorSnapshot() else nil
				end,
				restoreScrollAnchorSnapshot = function(p3): boolean
					-- upvalues: UseResult (upval), p1 (upval)
					UseResult()
					local Current = p1.current
					
					if Current == nil then
						return false
					else
						Current.restoreScrollAnchorSnapshot(p3)
						
						return true
					end
				end
			}
			p2.current = Current
			
			return function()
				-- upvalues: p2 (upval), Current (copy)
				if p2.current == Current then
					p2.current = nil
				end
			end
		end
	end, { p2, UseResult3, UseResult })
	
	return UseResult2
end