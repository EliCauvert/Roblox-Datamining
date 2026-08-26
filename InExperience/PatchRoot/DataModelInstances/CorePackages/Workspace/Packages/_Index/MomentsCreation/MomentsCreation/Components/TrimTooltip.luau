local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local getFormatTimeModule = require(momentsCreation.Utils.getFormatTime)
local dragHandleModule = require(momentsCreation.Enums.DragHandle)

return function(p1)
	-- upvalues: useTokens (ref), dragHandleModule (ref), reactModule (ref), view (ref), text (ref), getFormatTimeModule (ref)
	local var1 = useTokens()
	
	if not (if p1.activeHandle ~= dragHandleModule.LeftHandle then p1.activeHandle == dragHandleModule.RightHandle else true) or not p1.timeLength then
		return nil
	end
	local var2 = if p1.activeHandle == dragHandleModule.LeftHandle then p1.leftHandlePosition elseif p1.activeHandle == dragHandleModule.RightHandle then p1.rightHandlePosition else nil
	
	if var2 == nil then
		return nil
	end
	local timeLength = p1.timeLength
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-xsmall anchor-bottom-center",
		Position = var2:map(function(p2)
			-- upvalues: var1 (ref)
			return UDim2.new(p2, 0, 0, -var1.Padding.Small)
		end)
	}, {
		TextContainer = reactModule.createElement(view, {
			tag = "anchor-center-center size-1600-800 radius-small bg-system-contrast",
			LayoutOrder = 1
		}, {
			TimeText = reactModule.createElement(text, {
				tag = "position-center-center anchor-center-center auto-xy text-caption-medium content-inverse-default",
				Text = var2:map(function(p2)
					-- upvalues: getFormatTimeModule (copy), timeLength (ref)
					return getFormatTimeModule(p2 * timeLength)
				end)
			})
		}),
		VerticalBar = reactModule.createElement(view, {
			tag = "anchor-center-center size-50-300 bg-system-contrast",
			LayoutOrder = 2
		})
	})
end