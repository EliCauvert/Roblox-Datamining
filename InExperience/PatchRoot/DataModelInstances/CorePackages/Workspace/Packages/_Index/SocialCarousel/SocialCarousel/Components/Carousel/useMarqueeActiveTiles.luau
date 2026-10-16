local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)
local MarqueeEligibilityModule = require(script.Parent.marqueeEligibility)
local ScrollPauseModule = require(script.Parent.scrollPause)
local TileVisibilityModule = require(script.Parent.tileVisibility)

local function drawsOnTop(Frame: Frame): boolean --[[ Line: 50 ]]
	return if Frame:IsA("GuiObject") and Frame.Visible then Frame.BackgroundTransparency < 0.95 or (if Frame:IsA("ImageLabel") or Frame:IsA("ImageButton") then Frame.Image ~= "" and Frame.ImageTransparency < 0.95 else false) else false
end

local function isCoveredAt(Ancestor, Callback, NewX, p1): boolean --[[ Line: 64 ]]
	-- upvalues: drawsOnTop (copy)
	for _, Ancestor1 in Callback(NewX, p1) do
		if Ancestor1 == Ancestor or Ancestor1:IsDescendantOf(Ancestor) then
			return false
		elseif not Ancestor:IsDescendantOf(Ancestor1) and drawsOnTop(Ancestor1) then
			return true
		end
	end
	return false
end

local function _(List, Id) --[[ Line: 77 | Named "indexOfTileId" ]]
	for i, value in ipairs(List) do
		if value.id == Id then
			return i
		end
	end
	return nil
end

local function lastLocationFor(Tiles, ResolveActiveTileIdResult) --[[ Line: 86 ]]
	for _, tile in ipairs(Tiles) do
		if tile.id == ResolveActiveTileIdResult then
			local Presence = tile.presence
			local LastLocation = if Presence == nil then nil else Presence.lastLocation
			
			return if LastLocation == nil or LastLocation == "" then nil else LastLocation
		end
	end
	return nil
end

return {
	useMarqueeActiveTiles = function(p2, Current, p3, p4, p5) --[[ Line: 105 ]]
		-- upvalues: ReactModule (copy), ScrollPauseModule (copy), lastLocationFor (copy), MarqueeEligibilityModule (copy), RunService (copy), UserInputService (copy), TileVisibilityModule (copy), isCoveredAt (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState({})
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
		local UseRefResult = ReactModule.useRef(ScrollPauseModule.initialState())
		local UseRefResult1 = ReactModule.useRef({})
		local UseRefResult2 = ReactModule.useRef(nil)
		local UseRefResult3 = ReactModule.useRef(nil)
		local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
		local UseRefResult4 = ReactModule.useRef(0)
		local UseRefResult5 = ReactModule.useRef(Current)
		UseRefResult5.current = Current
		
		local function publishIndex(Current) --[[ Line: 133 ]]
			-- upvalues: UseRefResult3 (copy), UseStateResult2 (copy)
			if UseRefResult3.current == Current then return end
			UseRefResult3.current = Current
			
			if Current == nil then
				UseStateResult2({})
				
				return
			else
				UseStateResult2({ [Current] = true })
			end
		end
		
		local UseResult = ReactModule.useCallback(function(p6) --[[ Line: 145 ]]
			-- upvalues: UseRefResult5 (copy), lastLocationFor (upval), MarqueeEligibilityModule (upval), UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), publishIndex (copy), UseRefResult4 (copy), UseStateResult2_2 (copy)
			local Current = UseRefResult5.current
			
			if Current.idleSequenceEnabled ~= true then return end
			local Tiles = Current.tiles or {}
			local LastLocationForResult = lastLocationFor(Tiles, p6)
			
			if LastLocationForResult == nil then return end
			MarqueeEligibilityModule.recordFinishedLoop(UseRefResult1.current, p6, LastLocationForResult)
			local config = {
				interacting = false,
				direction = Current.direction or Enum.TextDirection.LeftToRight,
				reducedMotion = Current.reducedMotion == true,
				loopsRemaining = UseRefResult1.current,
				canvasX = UseRefResult.current.canvasX or 0,
				containerWidth = Current.containerWidth,
				tileWidth = Current.tileWidth,
				gap = Current.columnGap
			}
			local ResolveActiveTileIdResult = MarqueeEligibilityModule.resolveActiveTileId(Tiles, config, p6)
			
			if ResolveActiveTileIdResult ~= p6 then
				ResolveActiveTileIdResult = MarqueeEligibilityModule.nextEligibleAfter(Tiles, p6, config)
			end
			UseRefResult2.current = ResolveActiveTileIdResult
			local Current1 = nil
			
			if ResolveActiveTileIdResult == nil then
				Current1 = nil
			else
				local Id = ResolveActiveTileIdResult
				Current1 = nil
				
				for i, tile in ipairs(Tiles) do
					if tile.id == Id then
						Current1 = i
						break
					end
				end
			end
			publishIndex(Current1)
			
			if ResolveActiveTileIdResult == nil then return end
			local LastLocationForResult1 = lastLocationFor(Tiles, ResolveActiveTileIdResult)
			
			if LastLocationForResult1 == nil then return end
			local CurrentEntry = UseRefResult1.current[MarqueeEligibilityModule.loopKey(ResolveActiveTileIdResult, LastLocationForResult1)]
			
			if CurrentEntry ~= nil and CurrentEntry < MarqueeEligibilityModule.DEFAULT_LOOPS then
				UseRefResult4.current += 1
				UseStateResult2_2(UseRefResult4.current)
			end
		end, {})
		
		local function _(List, Id) --[[ Line: 192 | Named "tileById" ]]
			for _, value in ipairs(List) do
				if value.id == Id then
					return value
				end
			end
			return nil
		end
		
		local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 204 ]]
			-- upvalues: UseRefResult5 (copy), MarqueeEligibilityModule (upval), UseRefResult2 (copy), publishIndex (copy), UseRefResult4 (copy), UseStateResult2_2 (copy)
			local Current1 = UseRefResult5.current
			
			if Current1.hoverEnabled ~= true or Current1.reducedMotion == true then return end
			local Tiles = Current1.tiles or {}
			local v1 = nil
			
			for _, tile in ipairs(Tiles) do
				if tile.id == Current then
					v1 = tile
					break
				end
			end
			if v1 == nil or not MarqueeEligibilityModule.isHoverEligible(v1) then return end
			UseRefResult2.current = Current
			local Current2 = nil
			
			for i, tile1 in ipairs(Tiles) do
				if tile1.id == Current then
					Current2 = i
					break
				end
			end
			publishIndex(Current2)
			UseRefResult4.current += 1
			UseStateResult2_2(UseRefResult4.current)
		end, {})
		local UseResult2 = ReactModule.useCallback(function(Current) --[[ Line: 223 ]]
			-- upvalues: UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy)
			if UseRefResult5.current.hoverEnabled ~= true then return end
			if UseRefResult2.current ~= Current then return end
			UseRefResult2.current = nil
			
			if UseRefResult3.current ~= nil then
				UseRefResult3.current = nil
				UseStateResult2({})
				
				return
			end
		end, {})
		local UseRefResult6 = ReactModule.useRef({})
		ReactModule.useEffect(function() --[[ Line: 239 ]]
			-- upvalues: p2 (copy), p3 (copy), RunService (upval), p4 (copy), UserInputService (upval), p5 (copy), UseRefResult6 (copy), TileVisibilityModule (upval), isCoveredAt (upval), UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy), MarqueeEligibilityModule (upval), publishIndex (copy), UseRefResult1 (copy), UseRefResult (copy), ScrollPauseModule (upval), UseStateResult2_1 (copy)
			local Current = p2.current
			
			if Current == nil then return end
			local P10 = p3 or RunService.Heartbeat
			local P11 = p4 or UserInputService
			local P12 = p5 or function(p7, p8) --[[ Line: 248 ]]
				-- upvalues: Current (copy)
				local BasePlayerGui = Current:FindFirstAncestorWhichIsA("BasePlayerGui")
				
				return if BasePlayerGui == nil then {} else BasePlayerGui:GetGuiObjectsAtPosition(p7, p8)
			end
			local Connection = nil
			local Current1 = UseRefResult6.current
			local config = { current = next(Current1) ~= nil }
			local startHeartbeat = nil
			local Callback = nil
			
			local function _() --[[ Line: 261 | Named "stopHeartbeat" ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
			
			local function verticalPage() --[[ Line: 269 ]]
				-- upvalues: Current (copy)
				local v2 = nil
				local v3 = 0
				local Parent = Current.Parent
				while Parent ~= nil do
					if Parent:IsA("ScrollingFrame") then
						local OffsetDelta = Parent.CanvasSize.Y.Offset + Parent.CanvasSize.Y.Scale * Parent.AbsoluteSize.Y - Parent.AbsoluteSize.Y
						
						if v3 < OffsetDelta then
							v2 = Parent
							v3 = OffsetDelta
						end
					end
					Parent = Parent.Parent
				end
				return v2
			end
			
			local _ = function() --[[ Line: 288 | Named "verticalCanvasY" ]]
				-- upvalues: verticalPage (copy)
				local VerticalPageResult = verticalPage()
				
				return if VerticalPageResult == nil then nil else VerticalPageResult.CanvasPosition.Y
			end
			
			local function rowIsVerticallyEligible(): boolean --[[ Line: 297 ]]
				-- upvalues: verticalPage (copy), Current (copy), TileVisibilityModule (upval), isCoveredAt (upval), P12 (copy)
				local VerticalPageResult = verticalPage()
				
				if VerticalPageResult == nil then
					return true
				end
				local Y = Current.AbsolutePosition.Y
				local Y1 = Current.AbsoluteSize.Y
				local Y2 = VerticalPageResult.AbsolutePosition.Y
				local Y3 = VerticalPageResult.AbsoluteSize.Y
				
				if not TileVisibilityModule.isAtLeast70PercentVerticallyVisible(Y, Y1, Y2, Y3) then
					return false
				end
				local NewX = Current.AbsolutePosition.X + Current.AbsoluteSize.X / 2
				local Count = 0
				
				for i = 1, 20 do
					local NewY = Y + (i - 0.5) * Y1 / 20
					
					if Y2 <= NewY and NewY <= Y2 + Y3 and not isCoveredAt(Current, P12, NewX, NewY) then
						Count += 1
					end
				end
				return TileVisibilityModule.MIN_VISIBLE_FRACTION <= Count / 20
			end
			
			local function publish(CanvasX) --[[ Line: 324 ]]
				-- upvalues: UseRefResult5 (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2 (upval), MarqueeEligibilityModule (upval), publishIndex (upval), UseRefResult1 (upval)
				local Current = UseRefResult5.current
				
				if Current.hoverEnabled == true then
					local Tiles = Current.tiles or {}
					local Current1 = UseRefResult2.current
					local v4 = nil
					
					if Current1 == nil then
						v4 = nil
					else
						v4 = nil
						
						for _, tile in ipairs(Tiles) do
							if tile.id == Current1 then
								v4 = tile
								break
							end
						end
					end
					if v4 == nil or Current.reducedMotion == true then
						UseRefResult2.current = nil
						
						if UseRefResult3.current ~= nil then
							UseRefResult3.current = nil
							UseStateResult2({})
							
							return
						end
						return
					elseif MarqueeEligibilityModule.isHoverEligible(v4) then
						local Current2 = nil
						
						for i, tile1 in ipairs(Tiles) do
							if tile1.id == Current1 then
								Current2 = i
								break
							end
						end
						publishIndex(Current2)
						
						return
					else
						UseRefResult2.current = nil
						
						if UseRefResult3.current ~= nil then
							UseRefResult3.current = nil
							UseStateResult2({})
							
							return
						end
						return
					end
				elseif Current.idleSequenceEnabled == true then
					local Tiles = Current.tiles or {}
					local ResolveActiveTileIdResult = MarqueeEligibilityModule.resolveActiveTileId(Tiles, {
						interacting = false,
						direction = Current.direction or Enum.TextDirection.LeftToRight,
						reducedMotion = Current.reducedMotion == true,
						loopsRemaining = UseRefResult1.current,
						canvasX = CanvasX,
						containerWidth = Current.containerWidth,
						tileWidth = Current.tileWidth,
						gap = Current.columnGap
					}, UseRefResult2.current)
					UseRefResult2.current = ResolveActiveTileIdResult
					local Current3 = nil
					
					if ResolveActiveTileIdResult == nil then
						Current3 = nil
					else
						Current3 = nil
						
						for i1, tile2 in ipairs(Tiles) do
							if tile2.id == ResolveActiveTileIdResult then
								Current3 = i1
								break
							end
						end
					end
					publishIndex(Current3)
					
					return
				else
					UseRefResult2.current = nil
					
					if UseRefResult3.current ~= nil then
						UseRefResult3.current = nil
						UseStateResult2({})
						
						return
					end
				end
			end
			
			startHeartbeat = function() --[[ Line: 366 | Named "startHeartbeat" ]]
				-- upvalues: Connection (ref), P10 (copy), UseRefResult (upval), Callback (ref)
				if not Connection then
					Connection = P10:Connect(function(p7) --[[ Line: 370 ]]
						-- upvalues: UseRefResult (upval), Callback (upval)
						local CanvasX = UseRefResult.current.canvasX
						
						if CanvasX ~= nil then
							Callback(CanvasX, p7)
							
							return
						end
					end)
					
					return
				end
			end
			
			Callback = function(X, p7, p8) --[[ Line: 380 | Named "apply" ]]
				-- upvalues: UseRefResult (upval), ScrollPauseModule (upval), config (copy), verticalPage (copy), UseStateResult2_1 (upval), startHeartbeat (ref), Connection (ref), rowIsVerticallyEligible (copy), UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2 (upval), publish (copy)
				local Current = UseRefResult.current
				local AdvanceFunction = ScrollPauseModule.advance
				local Current1 = config.current
				local VerticalPageResult = verticalPage()
				local AdvanceResult = AdvanceFunction(Current, X, p7, Current1, if VerticalPageResult == nil then nil else VerticalPageResult.CanvasPosition.Y)
				UseRefResult.current = AdvanceResult
				
				if AdvanceResult.interacting then
					UseStateResult2_1(true)
					startHeartbeat()
					
					return
				end
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if not rowIsVerticallyEligible() then
					UseStateResult2_1(false)
					UseRefResult2.current = nil
					
					if UseRefResult3.current ~= nil then
						UseRefResult3.current = nil
						UseStateResult2({})
						
						return
					end
					return
				elseif Current.interacting or p8 or UseRefResult3.current == nil then
					UseStateResult2_1(false)
					publish(X)
				end
			end
			
			local function onInputBegan(Input) --[[ Line: 404 ]]
				-- upvalues: ScrollPauseModule (upval), verticalPage (copy), Current (copy), Current1 (copy), config (copy), Callback (ref)
				if not ScrollPauseModule.isPointerHold(Input.UserInputType) then return end
				local VerticalPageResult = verticalPage()
				
				if ScrollPauseModule.pointerIsInside(if VerticalPageResult == nil then Current.AbsolutePosition else VerticalPageResult.AbsolutePosition, if VerticalPageResult == nil then Current.AbsoluteSize else VerticalPageResult.AbsoluteSize, Vector2.new(Input.Position.X, Input.Position.Y)) then
					Current1[Input] = true
					config.current = true
					Callback(Current.CanvasPosition.X, 0)
					
					return
				end
			end
			
			local _ = function(Key) --[[ Line: 427 | Named "releaseHold" ]]
				-- upvalues: Current1 (copy), config (copy), Callback (ref), Current (copy)
				if Key == nil then
					table.clear(Current1)
				else
					if Current1[Key] == nil then return end
					Current1[Key] = nil
				end
				config.current = next(Current1) ~= nil
				Callback(Current.CanvasPosition.X, 0)
			end
			
			local function onCanvasPositionChanged() --[[ Line: 440 ]]
				-- upvalues: Callback (ref), Current (copy)
				Callback(Current.CanvasPosition.X, 0)
			end
			
			Callback(Current.CanvasPosition.X, 0, true)
			
			if UseRefResult.current.interacting then
				startHeartbeat()
			end
			local VerticalPageResult = verticalPage()
			local Connection1 = if VerticalPageResult then VerticalPageResult:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged) else nil
			local Connection2 = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
			local InputBeganConnection = P11.InputBegan:Connect(onInputBegan)
			local InputEndedConnection = P11.InputEnded:Connect(function(Input) --[[ Line: 457 ]]
				-- upvalues: Current1 (copy), config (copy), Callback (ref), Current (copy)
				if Input == nil then
					table.clear(Current1)
				else
					if Current1[Input] == nil then return end
					Current1[Input] = nil
				end
				config.current = next(Current1) ~= nil
				Callback(Current.CanvasPosition.X, 0)
			end)
			local WindowFocusReleasedConnection = if P11.WindowFocusReleased then P11.WindowFocusReleased:Connect(function() --[[ Line: 461 ]]
				-- upvalues: Current1 (copy), config (copy), Callback (ref), Current (copy)
				table.clear(Current1)
				config.current = next(Current1) ~= nil
				Callback(Current.CanvasPosition.X, 0)
			end) else nil
			
			return function() --[[ Line: 465 ]]
				-- upvalues: Connection (ref), Connection2 (copy), Connection1 (copy), InputBeganConnection (copy), InputEndedConnection (copy), WindowFocusReleasedConnection (copy)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				Connection2:Disconnect()
				
				if Connection1 then
					Connection1:Disconnect()
				end
				InputBeganConnection:Disconnect()
				InputEndedConnection:Disconnect()
				
				if WindowFocusReleasedConnection then
					WindowFocusReleasedConnection:Disconnect()
				end
			end
		end, {
			p2, p3, p4, p5, Current.tileCount, Current.containerWidth,
			Current.tileWidth, Current.columnGap, Current.tiles, Current.direction,
			Current.reducedMotion, Current.idleSequenceEnabled, Current.hoverEnabled
		})
		
		return {
			activeByIndex = UseStateResult,
			isPaused = UseStateResult1,
			loopsRemainingRef = UseRefResult1,
			onMarqueeFinished = UseResult,
			onMarqueeHover = UseResult1,
			onMarqueeHoverEnd = UseResult2,
			marqueeRunId = UseStateResult3
		}
	end
}