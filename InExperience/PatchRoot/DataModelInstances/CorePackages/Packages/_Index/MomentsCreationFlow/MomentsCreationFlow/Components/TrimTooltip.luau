local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetFormatTimeFunction = require(Parent.MomentsCommon).Utils.getFormatTime
local DragHandleModule = require(MomentsCreationFlow.Enums.DragHandle)

return function(p1) --[[ Line: 27 ]]
	-- upvalues: UseTokensFunction (copy), DragHandleModule (copy), ReactModule (copy), View (copy), Text (copy), GetFormatTimeFunction (copy)
	local UseTokensResult = UseTokensFunction()
	
	if (p1.activeHandle == DragHandleModule.LeftHandle or p1.activeHandle == DragHandleModule.RightHandle) and p1.timeLength then
		local LeftHandlePosition = if p1.activeHandle == DragHandleModule.LeftHandle then p1.leftHandlePosition elseif p1.activeHandle == DragHandleModule.RightHandle then p1.rightHandlePosition else nil
		
		return ReactModule.createElement(View, {
			tag = "align-x-center align-y-bottom anchor-bottom-center col gap-xsmall",
			Position = LeftHandlePosition:map(function(XScale): UDim2 --[[ Line: 44 ]]
				-- upvalues: UseTokensResult (copy)
				return UDim2.new(XScale, 0, 0, -UseTokensResult.Padding.Small)
			end)
		}, {
			TextContainer = ReactModule.createElement(View, {
				tag = "anchor-center-center bg-system-contrast size-1600-800 radius-small",
				LayoutOrder = 1
			}, {
				TimeText = ReactModule.createElement(Text, {
					tag = "anchor-center-center auto-xy content-inverse-default position-center-center text-caption-medium",
					Text = LeftHandlePosition:map(function(p2) --[[ Line: 54 ]]
						-- upvalues: GetFormatTimeFunction (upval), p1 (copy)
						return GetFormatTimeFunction(p2 * p1.timeLength)
					end)
				})
			}),
			VerticalBar = ReactModule.createElement(View, {
				tag = "anchor-center-center bg-system-contrast size-50-300",
				LayoutOrder = 2
			})
		})
	else
		return nil
	end
end