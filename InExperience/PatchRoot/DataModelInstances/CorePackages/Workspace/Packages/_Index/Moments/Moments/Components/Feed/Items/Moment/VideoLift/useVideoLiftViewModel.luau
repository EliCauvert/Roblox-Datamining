local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getCommentsSheetStoreModule = require(moments.Components.Comments.Sheet.getCommentsSheetStore)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local computeVideoLiftLayoutModule = require(script.Parent.computeVideoLiftLayout)
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local usePreferences = foundationModule.Hooks.usePreferences
local useTokens = foundationModule.Hooks.useTokens
local uDim2 = UDim2.fromScale(1, 1)
local uDim2_1 = UDim2.fromScale(0.5, 0.5)

local function _(p1, p2)
	return {
		scale = 1 + (p1.scale - 1) * p2,
		offsetY = p1.offsetY * p2,
		cornerRadius = p1.cornerRadius * p2
	}
end

local function useSettlingLayout(value, p1)
	-- upvalues: reactModule (ref), runService (ref), tweenService (ref), signalsModule (ref)
	local var1, var2 = reactModule.useBinding(value(false))
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref), runService (copy), tweenService (copy), signalsModule (copy), value (ref)
		local var3 = nil
		
		local function _()
			-- upvalues: var3 (write)
			if var3 ~= nil then
				var3:Disconnect()
				var3 = nil
			end
		end
		
		local function settle()
			-- upvalues: var1 (copy), var3 (write), p1 (copy), var2 (copy), runService (copy), tweenService (copy)
			local value = var1:getValue()
			
			if value == nil or var3 ~= nil then return end
			if p1 <= 0 then
				var2(nil)
				
				return
			end
			local var4 = 0
			var3 = runService.Heartbeat:Connect(function(p2)
				-- upvalues: var4 (write), p1 (copy), var3 (copy), var2 (copy), tweenService (copy), value (ref)
				var4 += p2
				local var5 = var4 / p1
				
				if var5 < 1 then
					local var6 = 1 - tweenService:GetValue(var5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					var2({
						scale = 1 + (value.scale - 1) * var6,
						offsetY = value.offsetY * var6,
						cornerRadius = value.cornerRadius * var6
					})
					
					return
				elseif var3 ~= nil then
					var3:Disconnect()
					var3 = nil
				end
				var2(nil)
			end)
		end
		
		local var4 = signalsModule.createEffect(function(p2)
			-- upvalues: value (copy), settle (ref), var3 (write), var2 (copy)
			local var5 = value(p2)
			
			if var5 == nil then
				settle()
				
				return
			elseif var3 ~= nil then
				var3:Disconnect()
				var3 = nil
			end
			var2(var5)
		end)
		
		return function()
			-- upvalues: var3 (write), var4 (ref)
			if var3 ~= nil then
				var3:Disconnect()
				var3 = nil
			end
			var4()
		end
	end, { value, p1, var1, var2 })
	
	return var1
end

return function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), momentContextModule (ref), reactModule (ref), signalsModule (ref), getCommentsSheetStoreModule (ref), computeVideoLiftLayoutModule (ref), getMomentsPreferencesStoreModule (ref), useSettlingLayout (ref), uDim2 (ref), uDim2_1 (ref)
	local var1 = useTokens()
	local small = var1.Padding.Small
	local medium = var1.Radius.Medium
	local var2 = if usePreferences().reducedMotion then 0 else var1.Time.Time_200
	local controller = momentContextModule.useMoment().controller
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var4, var5 = signalsModule.createSignal(0)
		local var6, var7 = signalsModule.createSignal(Vector2.zero)
		
		return {
			getTop = var4,
			getSize = var6,
			onChanged = function(p2)
				-- upvalues: var5 (ref), var7 (ref)
				var5(p2.AbsolutePosition.Y)
				var7(p2.AbsoluteSize)
			end
		}
	end, {})
	local var4 = useSettlingLayout(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getCommentsSheetStoreModule (copy), p1 (ref), computeVideoLiftLayoutModule (copy), var3 (ref), controller (ref), getMomentsPreferencesStoreModule (copy), small (ref), medium (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getCommentsSheetStoreModule (copy), p1 (copy), computeVideoLiftLayoutModule (copy), var3 (copy), controller (copy), getMomentsPreferencesStoreModule (copy), small (copy), medium (copy)
			local var5 = getCommentsSheetStoreModule(false)
			
			if p1 == nil or var5.getFeedItemId(p2) ~= p1 then
				return nil
			end
			local videoLift = var5.getVideoLift(p2)
			
			return if videoLift == nil then nil else computeVideoLiftLayoutModule({
				lift = videoLift,
				itemTop = var3.getTop(p2),
				itemSize = var3.getSize(p2),
				resolution = if controller ~= nil then nil else controller.getState(p2).resolution,
				scaleType = getMomentsPreferencesStoreModule(false).getMediaScaleType(p2),
				padding = small,
				cornerRadius = medium
			})
		end)
	end, {
		p1 or false,
		controller or false,
		var3,
		small,
		medium
	}), var2)
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), uDim2 (copy), uDim2_1 (copy), var3 (ref)
		return {
			size = var4:map(function(p2)
				-- upvalues: uDim2 (copy)
				return if p2 == nil then uDim2 else UDim2.fromScale(p2.scale, p2.scale)
			end),
			position = var4:map(function(p2)
				-- upvalues: uDim2_1 (copy)
				return if p2 == nil then uDim2_1 else UDim2.new(0.5, 0, 0.5, p2.offsetY)
			end),
			mediaSurface = {
				cornerRadius = var4:map(function(p2)
					return UDim.new(0, if p2 ~= nil then 0 else p2.cornerRadius)
				end)
			},
			onItemRectChanged = var3.onChanged
		}
	end, { var4, var3 })
end