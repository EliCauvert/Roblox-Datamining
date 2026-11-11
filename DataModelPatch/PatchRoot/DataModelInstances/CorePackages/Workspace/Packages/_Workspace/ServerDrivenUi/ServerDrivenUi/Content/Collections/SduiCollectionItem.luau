local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed

return ReactModule.memo(function(p1)
	-- upvalues: FFlagSduiPoolBackedFeed (copy), ReactModule (copy), ImpressionsTagUtility (copy), CryoModule (copy)
	local LayoutOrder = p1.layoutOrder
	local Size = p1.size
	local Position = p1.position
	local AnchorPoint = p1.anchorPoint
	local ZIndex = p1.zIndex
	local AutomaticSize = p1.automaticSize
	local InnerWrapperSize = if FFlagSduiPoolBackedFeed then p1.innerWrapperSize else nil
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.index)
		end
	end, { UseRefResult, p1.impressionsTag, p1.index })
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), ImpressionsTagUtility (upval), p1 (copy)
		UseRefResult.current = Current
		
		if Current then
			ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		if p1.onItemSizeChanged then
			p1.onItemSizeChanged(p1.index, p2)
		end
	end, { p1.onItemSizeChanged, p1.index })
	local Config = if FFlagSduiPoolBackedFeed and InnerWrapperSize ~= nil then {
		InnerWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = UseResult,
			Size = InnerWrapperSize,
			Position = UDim2.fromScale(0, 0)
		}, p1.children)
	} else p1.children
	
	if p1.minHeightBinding then
		Config = CryoModule.Dictionary.join(Config or {}, {
			SizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MinSize = p1.minHeightBinding:map(function(p2: number): Vector2
					return Vector2.new(0, if p2 and p2 > 0 then p2 else 0)
				end)
			})
		})
	end
	return ReactModule.createElement("Frame", {
		ref = if FFlagSduiPoolBackedFeed and InnerWrapperSize ~= nil then nil else UseResult,
		AnchorPoint = AnchorPoint,
		Position = Position,
		Size = Size,
		LayoutOrder = LayoutOrder or p1.index,
		ZIndex = ZIndex,
		BackgroundTransparency = 1,
		AutomaticSize = AutomaticSize,
		[ReactModule.Change.AbsoluteSize] = if p1.onItemSizeChanged then UseResult1 else nil,
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, Config)
end)