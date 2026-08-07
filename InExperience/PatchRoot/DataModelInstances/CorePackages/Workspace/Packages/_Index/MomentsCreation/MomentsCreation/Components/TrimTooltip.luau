local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local getFormatTimeModule = require(momentsCreation.Utils.getFormatTime)
local dragHandleModule = require(momentsCreation.Enums.DragHandle)

return function(p0) --[[ line: 30 ]]
	-- upvalues: useTokens (ref), dragHandleModule (ref), reactModule (ref), view (ref), text (ref), getFormatTimeModule (ref)
	local var5 = useTokens()
	
	if not (if p0.activeHandle ~= dragHandleModule.LeftHandle then p0.activeHandle == dragHandleModule.RightHandle else true) or not p0.timeLength then
		return nil
	end
	local var6 = if p0.activeHandle == dragHandleModule.LeftHandle then p0.leftHandlePosition elseif p0.activeHandle == dragHandleModule.RightHandle then p0.rightHandlePosition else nil
	
	if var6 == nil then
		return nil
	end
	local timeLength = p0.timeLength
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-xsmall anchor-bottom-center",
		Position = var6:map(function(p1) --[[ line: 52 ]]
			-- upvalues: var5 (ref)
			return UDim2.new(p1, 0, 0, -var5.Padding.Small)
		end)
	}, {
		TextContainer = reactModule.createElement(view, {
			tag = "anchor-center-center size-1600-800 radius-small bg-system-contrast",
			LayoutOrder = 1
		}, {
			TimeText = reactModule.createElement(text, {
				tag = "position-center-center anchor-center-center auto-xy text-caption-medium content-inverse-default",
				Text = var6:map(function(p2) --[[ line: 62 ]]
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