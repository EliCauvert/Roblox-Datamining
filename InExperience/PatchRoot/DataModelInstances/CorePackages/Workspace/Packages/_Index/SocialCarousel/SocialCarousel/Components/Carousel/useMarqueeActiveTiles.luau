local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local MarqueeEligibilityModule = require(script.Parent.marqueeEligibility)
local ScrollPauseModule = require(script.Parent.scrollPause)
local TileVisibilityModule = require(script.Parent.tileVisibility)
local EnumsModule = require(SocialCarousel.Common.Enums)

local function _()
	-- upvalues: UserInputService (copy), GuiService (copy)
	return UserInputService:GetMouseLocation() - GuiService:GetGuiInset()
end

local function tileIdUnderPointer(MouseLocationDelta, Callback)
	-- upvalues: EnumsModule (copy)
	local Attribute = nil
	for _, value in ipairs(Callback(MouseLocationDelta.X, MouseLocationDelta.Y)) do
		local Parent = value
		while Parent ~= nil do
			Attribute = Parent:GetAttribute(EnumsModule.MarqueeFriendIdAttribute)
			
			if typeof(Attribute) == "string" then
				return Attribute
			end
			Parent = Parent.Parent
		end
	end
	return nil
end

local function drawsOnTop(Frame: Frame): boolean
	return if Frame:IsA("GuiObject") and Frame.Visible then Frame.BackgroundTransparency < 0.95 or (if Frame:IsA("ImageLabel") or Frame:IsA("ImageButton") then Frame.Image ~= "" and Frame.ImageTransparency < 0.95 else false) else false
end

local function isCoveredAt(Ancestor, Callback, NewX, p1): boolean
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

local _ = function(List, Id)
	for i, value in ipairs(List) do
		if value.id == Id then
			return i
		end
	end
	return nil
end

local function lastLocationFor(Tiles, ResolveActiveTileIdResult)
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
	useMarqueeActiveTiles = function(p2, Current, p3, p4, p5, Callback)
		-- upvalues: ReactModule (copy), ScrollPauseModule (copy), lastLocationFor (copy), MarqueeEligibilityModule (copy), RunService (copy), UserInputService (copy), TileVisibilityModule (copy), isCoveredAt (copy), GuiService (copy), tileIdUnderPointer (copy), SignalsModule (copy)
		local v1 = nil
		if Current.restoredTileId == nil or Current.tiles == nil then
			v1 = nil
		else
			local RestoredTileId = Current.restoredTileId
			v1 = nil
			
			for i, tile in ipairs(Current.tiles) do
				if tile.id == RestoredTileId then
					v1 = i
					break
				end
			end
		end
		local UseStateResult, UseStateResult2 = ReactModule.useState(if v1 == nil then {} else { [v1] = true })
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(v1 ~= nil)
		local UseRefResult = ReactModule.useRef(ScrollPauseModule.initialState())
		local UseRefResult1 = ReactModule.useRef({})
		
		if Current.loopsRemainingStore ~= nil then
			UseRefResult1.current = Current.loopsRemainingStore.getLoopsRemaining(false)
		end
		local UseRefResult2 = ReactModule.useRef(Current.restoredTileId)
		local UseRefResult3 = ReactModule.useRef(v1)
		local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
		local UseRefResult4 = ReactModule.useRef(0)
		local UseRefResult5 = ReactModule.useRef(Current)
		UseRefResult5.current = Current
		local UseRefResult6 = ReactModule.useRef(function() end)
		local UseRefResult7 = ReactModule.useRef(if Current.restoredTileId == nil then 0 else 1)
		local UseRefResult8 = ReactModule.useRef(Current.restoredTileId ~= nil)
		local UseRefResult9 = ReactModule.useRef(Current.restoredTileId ~= nil)
		local UseRefResult10 = ReactModule.useRef(nil)
		local UseRefResult11 = ReactModule.useRef(false)
		
		local function _(p6)
			return if p6 == nil then nil else p6.current
		end
		
		local _ = function(p6)
			if p6.joinPopoverUserId ~= nil then
				return p6.joinPopoverUserId
			end
			local JoinSheetUserIdRef = p6.joinSheetUserIdRef
			local Current = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
			
			if Current == nil then
				local JoinPopoverUserIdRef = p6.joinPopoverUserIdRef
				
				return if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
			else
				return Current
			end
		end
		
		local _ = function(p6): boolean
			if p6.homeBlurredOrJoinCardOpen == true then
				return true
			end
			local JoinPopoverUserId = nil
			if p6.joinPopoverUserId == nil then
				local JoinSheetUserIdRef = p6.joinSheetUserIdRef
				local Current = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
				
				if Current == nil then
					local JoinPopoverUserIdRef = p6.joinPopoverUserIdRef
					JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
				else
					JoinPopoverUserId = Current
				end
			else
				JoinPopoverUserId = p6.joinPopoverUserId
			end
			return JoinPopoverUserId ~= nil
		end
		
		local _ = function(p6, JoinPopoverUserId): boolean
			local v2 = nil
			if p6.homeBlurredOrJoinCardOpen == true then
				v2 = true
			else
				local JoinPopoverUserId1 = nil
				if p6.joinPopoverUserId == nil then
					local JoinSheetUserIdRef = p6.joinSheetUserIdRef
					local Current = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
					
					if Current == nil then
						local JoinPopoverUserIdRef = p6.joinPopoverUserIdRef
						JoinPopoverUserId1 = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
					else
						JoinPopoverUserId1 = Current
					end
				else
					JoinPopoverUserId1 = p6.joinPopoverUserId
				end
				v2 = JoinPopoverUserId1 ~= nil
			end
			if not v2 then
				return false
			end
			local JoinPopoverUserId2 = nil
			if p6.joinPopoverUserId == nil then
				local JoinSheetUserIdRef = p6.joinSheetUserIdRef
				local Current = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
				
				if Current == nil then
					local JoinPopoverUserIdRef = p6.joinPopoverUserIdRef
					JoinPopoverUserId2 = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
				else
					JoinPopoverUserId2 = Current
				end
			else
				JoinPopoverUserId2 = p6.joinPopoverUserId
			end
			return JoinPopoverUserId2 == nil or JoinPopoverUserId2 == JoinPopoverUserId
		end
		
		local _ = function()
			-- upvalues: UseRefResult5 (copy), UseRefResult1 (copy)
			local LoopsRemainingStore = UseRefResult5.current.loopsRemainingStore
			
			return if LoopsRemainingStore == nil then UseRefResult1.current else LoopsRemainingStore.getLoopsRemaining(false)
		end
		
		local function publishIndex(Current)
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
		
		local _ = function()
			-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy)
			UseRefResult2.current = nil
			
			if UseRefResult3.current ~= nil then
				UseRefResult3.current = nil
				UseStateResult2({})
				
				return
			end
		end
		
		local UseResult = ReactModule.useCallback(function(p6)
			-- upvalues: UseRefResult9 (copy), UseRefResult5 (copy), lastLocationFor (upval), MarqueeEligibilityModule (upval), UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), publishIndex (copy), UseRefResult4 (copy), UseStateResult2_2 (copy)
			UseRefResult9.current = false
			local Current = UseRefResult5.current
			
			if Current.idleSequenceEnabled ~= true then return end
			local Tiles = Current.tiles or {}
			local LastLocationForResult = lastLocationFor(Tiles, p6)
			
			if LastLocationForResult == nil then return end
			local LoopsRemainingStore = UseRefResult5.current.loopsRemainingStore
			MarqueeEligibilityModule.recordFinishedLoop(if LoopsRemainingStore == nil then UseRefResult1.current else LoopsRemainingStore.getLoopsRemaining(false), p6, LastLocationForResult)
			local LoopsRemainingStore1 = UseRefResult5.current.loopsRemainingStore
			local config = {
				interacting = false,
				direction = Current.direction or Enum.TextDirection.LeftToRight,
				reducedMotion = Current.reducedMotion == true,
				loopsRemaining = if LoopsRemainingStore1 == nil then UseRefResult1.current else LoopsRemainingStore1.getLoopsRemaining(false),
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
				Current1 = nil
				
				for i, tile in ipairs(Tiles) do
					if tile.id == ResolveActiveTileIdResult then
						Current1 = i
						break
					end
				end
			end
			publishIndex(Current1)
			
			if ResolveActiveTileIdResult == nil then return end
			local LastLocationForResult1 = lastLocationFor(Tiles, ResolveActiveTileIdResult)
			
			if LastLocationForResult1 == nil then return end
			local LoopsRemainingStore2 = UseRefResult5.current.loopsRemainingStore
			local CurrentEntry = (if LoopsRemainingStore2 == nil then UseRefResult1.current else LoopsRemainingStore2.getLoopsRemaining(false))[MarqueeEligibilityModule.loopKey(ResolveActiveTileIdResult, LastLocationForResult1)]
			
			if CurrentEntry ~= nil and CurrentEntry < MarqueeEligibilityModule.DEFAULT_LOOPS then
				UseRefResult4.current += 1
				UseStateResult2_2(UseRefResult4.current)
			end
		end, {})
		
		local _ = function(List, Id)
			for _, value in ipairs(List) do
				if value.id == Id then
					return value
				end
			end
			return nil
		end
		
		local UseResult1 = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult5 (copy), MarqueeEligibilityModule (upval), UseRefResult10 (copy), UseRefResult2 (copy), UseRefResult3 (copy), publishIndex (copy), UseRefResult4 (copy), UseStateResult2_2 (copy)
			local Current1 = UseRefResult5.current
			
			if Current1.manualMarqueeEnabled ~= true or Current1.reducedMotion == true then return end
			local Tiles = Current1.tiles or {}
			local v2 = nil
			
			for _, tile in ipairs(Tiles) do
				if tile.id == Current then
					v2 = tile
					break
				end
			end
			if v2 == nil or not MarqueeEligibilityModule.isHoverEligible(v2) then return end
			UseRefResult10.current = nil
			
			if UseRefResult2.current == Current and UseRefResult3.current ~= nil then return end
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
		local UseResult2 = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult10 (copy), UseRefResult3 (copy), UseStateResult2 (copy)
			local Current1 = UseRefResult5.current
			local v3 = nil
			
			if Current1.homeBlurredOrJoinCardOpen == true then
				v3 = true
			else
				local JoinPopoverUserId = nil
				if Current1.joinPopoverUserId == nil then
					local JoinSheetUserIdRef = Current1.joinSheetUserIdRef
					local Current2 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
					
					if Current2 == nil then
						local JoinPopoverUserIdRef = Current1.joinPopoverUserIdRef
						JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
					else
						JoinPopoverUserId = Current2
					end
				else
					JoinPopoverUserId = Current1.joinPopoverUserId
				end
				v3 = JoinPopoverUserId ~= nil
			end
			if v3 then
				if UseRefResult2.current == Current then
					UseRefResult10.current = Current
				end
				return
			elseif Current1.manualMarqueeEnabled ~= true then return end
			if UseRefResult2.current ~= Current then return end
			UseRefResult2.current = nil
			
			if UseRefResult3.current ~= nil then
				UseRefResult3.current = nil
				UseStateResult2({})
				
				return
			end
		end, {})
		local UseRefResult12 = ReactModule.useRef({})
		ReactModule.useEffect(function()
			-- upvalues: Current (copy), p2 (copy), p3 (copy), RunService (upval), p4 (copy), UserInputService (upval), p5 (copy), UseRefResult12 (copy), TileVisibilityModule (upval), isCoveredAt (upval), UseRefResult5 (copy), UseRefResult11 (copy), UseRefResult9 (copy), MarqueeEligibilityModule (upval), UseRefResult2 (copy), UseStateResult2_1 (copy), publishIndex (copy), UseRefResult10 (copy), Callback (copy), GuiService (upval), tileIdUnderPointer (upval), UseRefResult3 (copy), UseStateResult2 (copy), UseResult1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult7 (copy), ScrollPauseModule (upval), UseRefResult8 (copy), UseRefResult6 (copy)
			if Current.marqueeEnabled == false then return end
			local Current1 = p2.current
			
			if Current1 == nil then return end
			local P11 = p3 or RunService.Heartbeat
			local P12 = p4 or UserInputService
			local P13 = p5 or function(p7, p8)
				-- upvalues: Current1 (copy)
				local BasePlayerGui = Current1:FindFirstAncestorWhichIsA("BasePlayerGui")
				
				return if BasePlayerGui == nil then {} else BasePlayerGui:GetGuiObjectsAtPosition(p7, p8)
			end
			local Connection = nil
			local Current2 = UseRefResult12.current
			local config = { current = next(Current2) ~= nil }
			local startHeartbeat = nil
			local Callback1 = nil
			
			local function _()
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
			
			local _ = function(ScrollFrame): number
				return math.max(ScrollFrame.CanvasSize.Y.Offset + ScrollFrame.CanvasSize.Y.Scale * ScrollFrame.AbsoluteSize.Y, ScrollFrame.AbsoluteCanvasSize.Y) - ScrollFrame.AbsoluteSize.Y
			end
			
			local function verticalPage()
				-- upvalues: Current1 (copy)
				local v3 = nil
				local v4 = 0
				local Parent = Current1.Parent
				while Parent ~= nil do
					if Parent:IsA("ScrollingFrame") then
						local LargestDelta = math.max(Parent.CanvasSize.Y.Offset + Parent.CanvasSize.Y.Scale * Parent.AbsoluteSize.Y, Parent.AbsoluteCanvasSize.Y) - Parent.AbsoluteSize.Y
						
						if v4 < LargestDelta then
							v3 = Parent
							v4 = LargestDelta
						end
					end
					Parent = Parent.Parent
				end
				return v3
			end
			
			local _ = function()
				-- upvalues: verticalPage (copy)
				local VerticalPageResult = verticalPage()
				
				return if VerticalPageResult == nil then nil else VerticalPageResult.CanvasPosition.Y
			end
			
			local _ = function()
				-- upvalues: verticalPage (copy), TileVisibilityModule (upval), Current1 (copy)
				local VerticalPageResult = verticalPage()
				
				return VerticalPageResult == nil or TileVisibilityModule.isAtLeast70PercentVerticallyVisible(Current1.AbsolutePosition.Y, Current1.AbsoluteSize.Y, VerticalPageResult.AbsolutePosition.Y, VerticalPageResult.AbsoluteSize.Y)
			end
			
			local function rowIsVerticallyEligible(): boolean
				-- upvalues: verticalPage (copy), TileVisibilityModule (upval), Current1 (copy), isCoveredAt (upval), P13 (copy)
				local VerticalPageResult = verticalPage()
				
				if VerticalPageResult ~= nil and not TileVisibilityModule.isAtLeast70PercentVerticallyVisible(Current1.AbsolutePosition.Y, Current1.AbsoluteSize.Y, VerticalPageResult.AbsolutePosition.Y, VerticalPageResult.AbsoluteSize.Y) then
					return false
				end
				local VerticalPageResult1 = verticalPage()
				
				if VerticalPageResult1 == nil then
					return true
				end
				local Y = Current1.AbsolutePosition.Y
				local Y1 = Current1.AbsoluteSize.Y
				local Y2 = VerticalPageResult1.AbsolutePosition.Y
				local Y3 = VerticalPageResult1.AbsoluteSize.Y
				local NewX = Current1.AbsolutePosition.X + Current1.AbsoluteSize.X / 2
				local Count = 0
				
				for i = 1, 20 do
					local NewY = Y + (i - 0.5) * Y1 / 20
					
					if Y2 <= NewY and NewY <= Y2 + Y3 and not isCoveredAt(Current1, P13, NewX, NewY) then
						Count += 1
					end
				end
				return TileVisibilityModule.MIN_VISIBLE_FRACTION <= Count / 20
			end
			
			local function publish(CanvasX, NoInteracting)
				-- upvalues: UseRefResult5 (upval), UseRefResult11 (upval), UseRefResult9 (upval), MarqueeEligibilityModule (upval), UseRefResult2 (upval), UseStateResult2_1 (upval), publishIndex (upval), UseRefResult10 (upval), Callback (upval), UserInputService (upval), GuiService (upval), tileIdUnderPointer (upval), P13 (copy), UseRefResult3 (upval), UseStateResult2 (upval), UseResult1 (upval), UseRefResult1 (upval)
				local Current = UseRefResult5.current
				local Current1 = nil
				
				if Current.homeBlurredOrJoinCardOpen == true then
					Current1 = true
				else
					local JoinPopoverUserId = nil
					if Current.joinPopoverUserId == nil then
						local JoinSheetUserIdRef = Current.joinSheetUserIdRef
						local Current2 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
						
						if Current2 == nil then
							local JoinPopoverUserIdRef = Current.joinPopoverUserIdRef
							JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
						else
							JoinPopoverUserId = Current2
						end
					else
						JoinPopoverUserId = Current.joinPopoverUserId
					end
					Current1 = JoinPopoverUserId ~= nil
				end
				local NoCurrent1: boolean = UseRefResult11.current and not Current1
				UseRefResult11.current = Current1
				local RestoredTileId = Current.restoredTileId
				
				if UseRefResult9.current and RestoredTileId ~= nil then
					local Tiles = Current.tiles or {}
					local v5 = nil
					
					for _, tile in ipairs(Tiles) do
						if tile.id == RestoredTileId then
							v5 = tile
							break
						end
					end
					local Current3 = nil
					if v5 == nil then
						Current3 = nil
					else
						Current3 = nil
						
						for i, tile1 in ipairs(Tiles) do
							if tile1.id == RestoredTileId then
								Current3 = i
								break
							end
						end
					end
					if Current3 == nil or not MarqueeEligibilityModule.isHoverEligible(v5) then
						UseRefResult9.current = false
					else
						UseRefResult2.current = RestoredTileId
						
						if Current.homeBlurredOrJoinCardOpen == true then
							UseStateResult2_1(true)
						end
						publishIndex(Current3)
						
						return
					end
				end
				if Current.manualMarqueeEnabled == true then
					if NoCurrent1 then
						UseRefResult10.current = nil
						
						if Current.isDesktop == true then
							local TileIdUnderPointerResult = tileIdUnderPointer(if Callback == nil then UserInputService:GetMouseLocation() - GuiService:GetGuiInset() else Callback(), P13)
							
							if TileIdUnderPointerResult == nil then
								UseRefResult2.current = nil
								
								if UseRefResult3.current ~= nil then
									UseRefResult3.current = nil
									UseStateResult2({})
									
									return
								end
								return
							else
								UseResult1(TileIdUnderPointerResult)
								
								if UseRefResult2.current ~= TileIdUnderPointerResult then
									UseRefResult2.current = nil
									
									if UseRefResult3.current == nil then return end
									UseRefResult3.current = nil
									UseStateResult2({})
								end
								return
							end
						end
					end
					local Tiles = Current.tiles or {}
					local Current4 = UseRefResult2.current
					local v6 = nil
					
					if Current4 == nil then
						v6 = nil
					else
						v6 = nil
						
						for _, tile2 in ipairs(Tiles) do
							if tile2.id == Current4 then
								v6 = tile2
								break
							end
						end
					end
					if v6 == nil or Current.reducedMotion == true then
						UseRefResult2.current = nil
						
						if UseRefResult3.current ~= nil then
							UseRefResult3.current = nil
							UseStateResult2({})
							
							return
						end
						return
					elseif MarqueeEligibilityModule.isHoverEligible(v6) then
						local Current5 = nil
						
						for i1, tile3 in ipairs(Tiles) do
							if tile3.id == Current4 then
								Current5 = i1
								break
							end
						end
						publishIndex(Current5)
						
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
					local LoopsRemainingStore = UseRefResult5.current.loopsRemainingStore
					local config = {
						interacting = false,
						direction = Current.direction or Enum.TextDirection.LeftToRight,
						reducedMotion = Current.reducedMotion == true,
						loopsRemaining = if LoopsRemainingStore == nil then UseRefResult1.current else LoopsRemainingStore.getLoopsRemaining(false),
						canvasX = CanvasX,
						containerWidth = Current.containerWidth,
						tileWidth = Current.tileWidth,
						gap = Current.columnGap
					}
					local ResolveActiveTileIdResult = if NoInteracting then MarqueeEligibilityModule.resolveActiveTileId(Tiles, config, UseRefResult2.current) else MarqueeEligibilityModule.leadingEligible(Tiles, config)
					UseRefResult2.current = ResolveActiveTileIdResult
					local Current6 = nil
					
					if ResolveActiveTileIdResult == nil then
						Current6 = nil
					else
						Current6 = nil
						
						for i3, tile4 in ipairs(Tiles) do
							if tile4.id == ResolveActiveTileIdResult then
								Current6 = i3
								break
							end
						end
					end
					publishIndex(Current6)
					
					return
				else
					local Current6 = UseRefResult2.current
					
					if Current6 ~= nil then
						local v7 = nil
						if Current.homeBlurredOrJoinCardOpen == true then
							v7 = true
						else
							local JoinPopoverUserId = nil
							if Current.joinPopoverUserId == nil then
								local JoinSheetUserIdRef = Current.joinSheetUserIdRef
								local Current7 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
								
								if Current7 == nil then
									local JoinPopoverUserIdRef = Current.joinPopoverUserIdRef
									JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
								else
									JoinPopoverUserId = Current7
								end
							else
								JoinPopoverUserId = Current.joinPopoverUserId
							end
							v7 = JoinPopoverUserId ~= nil
						end
						local v8 = nil
						if v7 then
							local JoinPopoverUserId = nil
							if Current.joinPopoverUserId == nil then
								local JoinSheetUserIdRef = Current.joinSheetUserIdRef
								local Current8 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
								
								if Current8 == nil then
									local JoinPopoverUserIdRef = Current.joinPopoverUserIdRef
									JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
								else
									JoinPopoverUserId = Current8
								end
							else
								JoinPopoverUserId = Current.joinPopoverUserId
							end
							v8 = JoinPopoverUserId == nil or JoinPopoverUserId == Current6
						else
							v8 = false
						end
						if v8 then
							local Tiles1 = Current.tiles or {}
							local Current9 = nil
							
							for i2, value in ipairs(Tiles1) do
								if value.id == Current6 then
									Current9 = i2
									break
								end
							end
							if Current9 ~= nil then
								publishIndex(Current9)
								
								return
							end
						end
					end
					UseRefResult10.current = nil
					UseStateResult2_1(false)
					UseRefResult2.current = nil
					
					if UseRefResult3.current ~= nil then
						UseRefResult3.current = nil
						UseStateResult2({})
						
						return
					end
				end
			end
			
			startHeartbeat = function()
				-- upvalues: Connection (ref), P11 (copy), UseRefResult (upval), UseRefResult7 (upval), Callback1 (ref)
				if not Connection then
					Connection = P11:Connect(function(p7: number)
						-- upvalues: UseRefResult (upval), UseRefResult7 (upval), Callback1 (upval)
						local CanvasX = UseRefResult.current.canvasX
						
						if CanvasX ~= nil then
							UseRefResult7.current = math.max(0, UseRefResult7.current - math.max(p7, 0))
							Callback1(CanvasX, p7)
							
							return
						end
					end)
					
					return
				end
			end
			
			Callback1 = function(X, p7, p8, Enabled)
				-- upvalues: UseRefResult (upval), ScrollPauseModule (upval), config (copy), verticalPage (copy), UseStateResult2_1 (upval), startHeartbeat (ref), rowIsVerticallyEligible (copy), UseRefResult2 (upval), UseRefResult5 (upval), UseRefResult7 (upval), UseRefResult8 (upval), publishIndex (upval), Connection (ref), UseRefResult3 (upval), UseStateResult2 (upval), UseRefResult9 (upval), publish (copy)
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
				if rowIsVerticallyEligible() then
					local Current3 = UseRefResult8.current
					UseRefResult8.current = false
					UseRefResult7.current = 0
					
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
					if Current.interacting or p8 or (UseRefResult3.current == nil or Current3) then
						if Current.interacting then
							UseRefResult9.current = false
						end
						UseStateResult2_1(false)
						publish(X, if Enabled == true then not Current.interacting else Current3 and not Current.interacting)
					end
					return
				else
					local Current2 = UseRefResult2.current
					
					if Current2 ~= nil then
						local Current4 = UseRefResult5.current
						local v9 = nil
						
						if Current4.homeBlurredOrJoinCardOpen == true then
							v9 = true
						else
							local JoinPopoverUserId = nil
							if Current4.joinPopoverUserId == nil then
								local JoinSheetUserIdRef = Current4.joinSheetUserIdRef
								local Current5 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
								
								if Current5 == nil then
									local JoinPopoverUserIdRef = Current4.joinPopoverUserIdRef
									JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
								else
									JoinPopoverUserId = Current5
								end
							else
								JoinPopoverUserId = Current4.joinPopoverUserId
							end
							v9 = JoinPopoverUserId ~= nil
						end
						local v10 = nil
						if v9 then
							local JoinPopoverUserId = nil
							if Current4.joinPopoverUserId == nil then
								local JoinSheetUserIdRef = Current4.joinSheetUserIdRef
								local Current6 = if JoinSheetUserIdRef == nil then nil else JoinSheetUserIdRef.current
								
								if Current6 == nil then
									local JoinPopoverUserIdRef = Current4.joinPopoverUserIdRef
									JoinPopoverUserId = if JoinPopoverUserIdRef == nil then nil else JoinPopoverUserIdRef.current
								else
									JoinPopoverUserId = Current6
								end
							else
								JoinPopoverUserId = Current4.joinPopoverUserId
							end
							v10 = JoinPopoverUserId == nil or JoinPopoverUserId == Current2
						else
							v10 = false
						end
						if v10 or UseRefResult7.current > 0 then
							UseRefResult8.current = true
							UseStateResult2_1(true)
							local Tiles = UseRefResult5.current.tiles or {}
							local Current7 = nil
							
							for i, tile in ipairs(Tiles) do
								if tile.id == Current2 then
									Current7 = i
									break
								end
							end
							publishIndex(Current7)
							
							if UseRefResult7.current > 0 then
								startHeartbeat()
								
								return
							end
							if Connection then
								Connection:Disconnect()
								Connection = nil
							end
							return
						end
					end
					UseRefResult8.current = false
					UseStateResult2_1(false)
					UseRefResult2.current = nil
					
					if UseRefResult3.current ~= nil then
						UseRefResult3.current = nil
						UseStateResult2({})
					end
					if UseRefResult7.current > 0 then
						startHeartbeat()
						
						return
					end
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
				end
			end
			
			local function onInputBegan(Input)
				-- upvalues: ScrollPauseModule (upval), verticalPage (copy), Current1 (copy), Current2 (copy), config (copy), Callback1 (ref)
				if not ScrollPauseModule.isPointerHold(Input.UserInputType) then return end
				local VerticalPageResult = verticalPage()
				
				if ScrollPauseModule.pointerIsInside(if VerticalPageResult == nil then Current1.AbsolutePosition else VerticalPageResult.AbsolutePosition, if VerticalPageResult == nil then Current1.AbsoluteSize else VerticalPageResult.AbsoluteSize, Vector2.new(Input.Position.X, Input.Position.Y)) then
					Current2[Input] = true
					config.current = true
					Callback1(Current1.CanvasPosition.X, 0)
					
					return
				end
			end
			
			local _ = function(Key)
				-- upvalues: Current2 (copy), config (copy), Callback1 (ref), Current1 (copy)
				if Key == nil then
					table.clear(Current2)
				else
					if Current2[Key] == nil then return end
					Current2[Key] = nil
				end
				config.current = next(Current2) ~= nil
				Callback1(Current1.CanvasPosition.X, 0)
			end
			
			local function onCanvasPositionChanged()
				-- upvalues: Callback1 (ref), Current1 (copy)
				Callback1(Current1.CanvasPosition.X, 0)
			end
			
			function UseRefResult6.current()
				-- upvalues: UseRefResult7 (upval), Callback1 (ref), Current1 (copy)
				UseRefResult7.current = 1
				Callback1(Current1.CanvasPosition.X, 0, true)
			end
			
			local Current3 = UseRefResult5.current
			
			if Current3.idleSequenceEnabled == true then
				local LoopsRemainingStore = UseRefResult5.current.loopsRemainingStore
				MarqueeEligibilityModule.reconcilePresence(if LoopsRemainingStore == nil then UseRefResult1.current else LoopsRemainingStore.getLoopsRemaining(false), Current3.tiles or {})
			end
			Callback1(Current1.CanvasPosition.X, 0, true, true)
			
			if UseRefResult.current.interacting then
				startHeartbeat()
			end
			local v11 = nil
			local Connection1 = nil
			local List = {}
			
			local _ = function()
				-- upvalues: verticalPage (copy), v11 (ref), Connection1 (ref), onCanvasPositionChanged (copy)
				local VerticalPageResult = verticalPage()
				
				if VerticalPageResult == v11 then return end
				if Connection1 then
					Connection1:Disconnect()
					Connection1 = nil
				end
				v11 = VerticalPageResult
				
				if VerticalPageResult ~= nil then
					Connection1 = VerticalPageResult:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
				end
			end
			
			local VerticalPageResult = verticalPage()
			
			if VerticalPageResult ~= v11 then
				if Connection1 then
					Connection1:Disconnect()
					Connection1 = nil
				end
				v11 = VerticalPageResult
				
				if VerticalPageResult ~= nil then
					Connection1 = VerticalPageResult:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
				end
			end
			local Parent = Current1.Parent
			while Parent ~= nil do
				if Parent:IsA("ScrollingFrame") then
					table.insert(List, Parent:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
						-- upvalues: v11 (ref), verticalPage (copy), Connection1 (ref), onCanvasPositionChanged (copy), Callback1 (ref), Current1 (copy)
						local v12 = v11
						local VerticalPageResult = verticalPage()
						
						if VerticalPageResult ~= v11 then
							if Connection1 then
								Connection1:Disconnect()
								Connection1 = nil
							end
							v11 = VerticalPageResult
							
							if VerticalPageResult ~= nil then
								Connection1 = VerticalPageResult:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
							end
						end
						if v11 ~= v12 then
							Callback1(Current1.CanvasPosition.X, 0)
						end
					end))
				end
				Parent = Parent.Parent
			end
			local Connection2 = Current1:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
			local InputBeganConnection = P12.InputBegan:Connect(onInputBegan)
			local InputEndedConnection = P12.InputEnded:Connect(function(Input)
				-- upvalues: Current2 (copy), config (copy), Callback1 (ref), Current1 (copy)
				if Input == nil then
					table.clear(Current2)
				else
					if Current2[Input] == nil then return end
					Current2[Input] = nil
				end
				config.current = next(Current2) ~= nil
				Callback1(Current1.CanvasPosition.X, 0)
			end)
			local WindowFocusReleasedConnection = if P12.WindowFocusReleased then P12.WindowFocusReleased:Connect(function()
				-- upvalues: Current2 (copy), config (copy), Callback1 (ref), Current1 (copy)
				table.clear(Current2)
				config.current = next(Current2) ~= nil
				Callback1(Current1.CanvasPosition.X, 0)
			end) else nil
			
			return function()
				-- upvalues: UseRefResult6 (upval), Connection (ref), Connection2 (copy), Connection1 (ref), List (copy), InputBeganConnection (copy), InputEndedConnection (copy), WindowFocusReleasedConnection (copy)
				function UseRefResult6.current() end
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				Connection2:Disconnect()
				
				if Connection1 then
					Connection1:Disconnect()
				end
				for _, Connection3 in List do
					Connection3:Disconnect()
				end
				InputBeganConnection:Disconnect()
				InputEndedConnection:Disconnect()
				
				if WindowFocusReleasedConnection then
					WindowFocusReleasedConnection:Disconnect()
				end
			end
		end, {
			p2, p3, p4, p5, Callback, Current.tileCount, Current.containerWidth,
			Current.tileWidth, Current.columnGap, Current.tiles, Current.direction,
			Current.reducedMotion, Current.idleSequenceEnabled,
			Current.manualMarqueeEnabled, Current.joinPopoverUserId,
			Current.loopsRemainingStore, Current.marqueeEnabled
		})
		ReactModule.useEffect(function()
			-- upvalues: Current (copy), SignalsModule (upval), UseRefResult6 (copy)
			if Current.marqueeEnabled == false then return end
			local LoopsRemainingStore = Current.loopsRemainingStore
			local GetHomeFocusVersion = if LoopsRemainingStore == nil then nil else LoopsRemainingStore.getHomeFocusVersion
			
			if GetHomeFocusVersion == nil then return end
			local v12 = nil
			
			return SignalsModule.createEffect(function(p9)
				-- upvalues: GetHomeFocusVersion (copy), v12 (ref), UseRefResult6 (upval)
				local HomeFocusVersion = GetHomeFocusVersion(p9)
				
				if v12 == HomeFocusVersion then return end
				local v13 = v12 == nil
				v12 = HomeFocusVersion
				
				if not v13 then
					UseRefResult6.current()
					
					return
				end
			end)
		end, { Current.loopsRemainingStore, Current.marqueeEnabled })
		
		return {
			activeByIndex = UseStateResult,
			isPaused = UseStateResult1,
			loopsRemainingRef = UseRefResult1,
			onMarqueeFinished = UseResult,
			onManualMarqueeStart = UseResult1,
			onManualMarqueeEnd = UseResult2,
			marqueeRunId = UseStateResult3
		}
	end
}