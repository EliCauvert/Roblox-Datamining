local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetCommentsSheetStoreModule = require(Moments.Components.Comments.Sheet.getCommentsSheetStore)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local ComputeVideoLiftLayoutModule = require(script.Parent.computeVideoLiftLayout)
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetSmartFillScaleTypeFunction = MomentsCommonModule.Utils.getSmartFillScaleType
local FFlagMomentsSmartVideoFill = MomentsCommonModule.Flags.FFlagMomentsSmartVideoFill
local _UDim2 = UDim2.fromScale(1, 1)
local _UDim2_1 = UDim2.fromScale(0.5, 0.5)

local function _(p1, p2) --[[ Line: 36 | Named "scaleLayout" ]]
	return {
		scale = 1 + (p1.scale - 1) * p2,
		offsetY = p1.offsetY * p2,
		cornerRadius = p1.cornerRadius * p2
	}
end

local function useSettlingLayout(Callback, Time) --[[ Line: 46 ]]
	-- upvalues: ReactModule (copy), RunService (copy), TweenService (copy), SignalsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Callback(false))
	ReactModule.useLayoutEffect(function() --[[ Line: 52 ]]
		-- upvalues: UseBindingResult (copy), Time (copy), UseBindingResult2 (copy), RunService (upval), TweenService (upval), SignalsModule (upval), Callback (copy)
		local HeartbeatConnection = nil
		
		local function _() --[[ Line: 54 | Named "stopSettling" ]]
			-- upvalues: HeartbeatConnection (ref)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
		end
		
		local function settle() --[[ Line: 61 ]]
			-- upvalues: UseBindingResult (upval), HeartbeatConnection (ref), Time (upval), UseBindingResult2 (upval), RunService (upval), TweenService (upval)
			local Value = UseBindingResult:getValue()
			
			if Value == nil or HeartbeatConnection ~= nil then return end
			if Time <= 0 then
				UseBindingResult2(nil)
				
				return
			else
				local Total = 0
				HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 72 ]]
					-- upvalues: Total (ref), Time (upval), HeartbeatConnection (upval), UseBindingResult2 (upval), TweenService (upval), Value (copy)
					Total += DeltaTime
					local TotalRatio = Total / Time
					
					if TotalRatio < 1 then
						local v1 = 1 - TweenService:GetValue(TotalRatio, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
						UseBindingResult2({
							scale = 1 + (Value.scale - 1) * v1,
							offsetY = Value.offsetY * v1,
							cornerRadius = Value.cornerRadius * v1
						})
						
						return
					end
					if HeartbeatConnection ~= nil then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
					UseBindingResult2(nil)
				end)
			end
		end
		
		local Effect = SignalsModule.createEffect(function(p1) --[[ Line: 85 ]]
			-- upvalues: Callback (upval), settle (copy), HeartbeatConnection (ref), UseBindingResult2 (upval)
			local CallbackResult = Callback(p1)
			
			if CallbackResult == nil then
				settle()
				
				return
			end
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			UseBindingResult2(CallbackResult)
		end)
		
		return function() --[[ Line: 94 ]]
			-- upvalues: HeartbeatConnection (ref), Effect (copy)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			Effect()
		end
	end, { Callback, Time, UseBindingResult, UseBindingResult2 })
	
	return UseBindingResult
end

return function(FeedItemId) --[[ Line: 103 | Named "useVideoLiftViewModel" ]]
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), MomentContextModule (copy), ReactModule (copy), SignalsModule (copy), GetCommentsSheetStoreModule (copy), ComputeVideoLiftLayoutModule (copy), FFlagMomentsSmartVideoFill (copy), GetSmartFillScaleTypeFunction (copy), GetMomentsPreferencesStoreModule (copy), useSettlingLayout (copy), _UDim2 (copy), _UDim2_1 (copy)
	local UseTokensResult = UseTokensFunction()
	local Small = UseTokensResult.Padding.Small
	local Medium = UseTokensResult.Radius.Medium
	local Controller = MomentContextModule.useMoment().controller
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 110 ]]
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		local Signal1, Signal2_1 = SignalsModule.createSignal(Vector2.zero)
		
		return {
			getTop = Signal,
			getSize = Signal1,
			onChanged = function(Frame: Frame) --[[ Line: 116 ]]
				-- upvalues: Signal2 (copy), Signal2_1 (copy)
				Signal2(Frame.AbsolutePosition.Y)
				Signal2_1(Frame.AbsoluteSize)
			end
		}
	end, {})
	local UseSettlingLayoutResult = useSettlingLayout(ReactModule.useMemo(function() --[[ Line: 123 ]]
		-- upvalues: SignalsModule (upval), GetCommentsSheetStoreModule (upval), FeedItemId (copy), ComputeVideoLiftLayoutModule (upval), UseMemoResult (copy), Controller (copy), FFlagMomentsSmartVideoFill (upval), GetSmartFillScaleTypeFunction (upval), GetMomentsPreferencesStoreModule (upval), Small (copy), Medium (copy)
		return SignalsModule.createComputed(function(p1) --[[ Line: 124 ]]
			-- upvalues: GetCommentsSheetStoreModule (upval), FeedItemId (upval), ComputeVideoLiftLayoutModule (upval), UseMemoResult (upval), Controller (upval), FFlagMomentsSmartVideoFill (upval), GetSmartFillScaleTypeFunction (upval), GetMomentsPreferencesStoreModule (upval), Small (upval), Medium (upval)
			local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
			
			if FeedItemId == nil or CommentsSheetStoreModule.getFeedItemId(p1) ~= FeedItemId then
				return nil
			else
				local VideoLift = CommentsSheetStoreModule.getVideoLift(p1)
				
				return if VideoLift == nil then nil else ComputeVideoLiftLayoutModule({
					lift = VideoLift,
					itemTop = UseMemoResult.getTop(p1),
					itemSize = UseMemoResult.getSize(p1),
					resolution = if Controller == nil then nil else Controller.getState(p1).resolution,
					scaleType = if FFlagMomentsSmartVideoFill then GetSmartFillScaleTypeFunction(GetMomentsPreferencesStoreModule(false).getMediaScaleType(p1), UseMemoResult.getSize(p1), if Controller == nil then nil else Controller.getState(p1).resolution) else GetMomentsPreferencesStoreModule(false).getMediaScaleType(p1),
					padding = Small,
					cornerRadius = Medium
				})
			end
		end)
	end, {
		FeedItemId or false,
		Controller or false,
		UseMemoResult,
		Small,
		Medium
	}), if UsePreferencesFunction().reducedMotion then 0 else UseTokensResult.Time.Time_200)
	
	return ReactModule.useMemo(function() --[[ Line: 155 ]]
		-- upvalues: UseSettlingLayoutResult (copy), _UDim2 (upval), _UDim2_1 (upval), UseMemoResult (copy)
		return {
			size = UseSettlingLayoutResult:map(function(p1) --[[ Line: 157 ]]
				-- upvalues: _UDim2 (upval)
				return if p1 == nil then _UDim2 else UDim2.fromScale(p1.scale, p1.scale)
			end),
			position = UseSettlingLayoutResult:map(function(p1) --[[ Line: 160 ]]
				-- upvalues: _UDim2_1 (upval)
				return if p1 == nil then _UDim2_1 else UDim2.new(0.5, 0, 0.5, p1.offsetY)
			end),
			mediaSurface = {
				cornerRadius = UseSettlingLayoutResult:map(function(p1): UDim --[[ Line: 164 ]]
					return UDim.new(0, if p1 == nil then 0 else p1.cornerRadius)
				end)
			},
			onItemRectChanged = UseMemoResult.onChanged
		}
	end, { UseSettlingLayoutResult, UseMemoResult })
end