local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local getFormatTime = momentsCommonModule.Utils.getFormatTime
local dragHandleModule = require(momentsCreationFlow.Enums.DragHandle)

return function(p1)
	-- upvalues: useTokens (ref), dragHandleModule (ref), reactModule (ref), view (ref), text (ref), getFormatTime (ref)
	local var1 = useTokens()
	
	if (p1.activeHandle == dragHandleModule.LeftHandle or p1.activeHandle == dragHandleModule.RightHandle) and p1.timeLength then
		local var2 = if p1.activeHandle == dragHandleModule.LeftHandle then p1.leftHandlePosition elseif p1.activeHandle == dragHandleModule.RightHandle then p1.rightHandlePosition else nil
		
		return reactModule.createElement(view, {
			tag = "align-x-center align-y-bottom anchor-bottom-center col gap-xsmall",
			Position = var2:map(function(p2)
				-- upvalues: var1 (ref)
				return UDim2.new(p2, 0, 0, -var1.Padding.Small)
			end)
		}, {
			TextContainer = reactModule.createElement(view, {
				tag = "anchor-center-center bg-system-contrast size-1600-800 radius-small",
				LayoutOrder = 1
			}, {
				TimeText = reactModule.createElement(text, {
					tag = "anchor-center-center auto-xy content-inverse-default position-center-center text-caption-medium",
					Text = var2:map(function(p2)
						-- upvalues: getFormatTime (copy), p1 (ref)
						return getFormatTime(p2 * p1.timeLength)
					end)
				})
			}),
			VerticalBar = reactModule.createElement(view, {
				tag = "anchor-center-center bg-system-contrast size-50-300",
				LayoutOrder = 2
			})
		})
	end
	return nil
end