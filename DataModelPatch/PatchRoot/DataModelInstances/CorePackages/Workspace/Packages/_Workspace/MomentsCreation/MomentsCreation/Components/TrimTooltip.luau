local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetFormatTimeModule = require(MomentsCreation.Utils.getFormatTime)
local DragHandleModule = require(MomentsCreation.Enums.DragHandle)

return function(p1)
	-- upvalues: UseTokensFunction (copy), DragHandleModule (copy), ReactModule (copy), View (copy), Text (copy), GetFormatTimeModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1.activeHandle ~= DragHandleModule.LeftHandle and p1.activeHandle ~= DragHandleModule.RightHandle or not p1.timeLength then
		return nil
	end
	local LeftHandlePosition = if p1.activeHandle == DragHandleModule.LeftHandle then p1.leftHandlePosition elseif p1.activeHandle == DragHandleModule.RightHandle then p1.rightHandlePosition else nil
	
	if LeftHandlePosition == nil then
		return nil
	else
		local TimeLength = p1.timeLength
		
		return ReactModule.createElement(View, {
			tag = "col align-x-center align-y-bottom gap-xsmall anchor-bottom-center",
			Position = LeftHandlePosition:map(function(XScale): UDim2
				-- upvalues: UseTokensResult (copy)
				return UDim2.new(XScale, 0, 0, -UseTokensResult.Padding.Small)
			end)
		}, {
			TextContainer = ReactModule.createElement(View, {
				tag = "anchor-center-center size-1600-800 radius-small bg-system-contrast",
				LayoutOrder = 1
			}, {
				TimeText = ReactModule.createElement(Text, {
					tag = "position-center-center anchor-center-center auto-xy text-caption-medium content-inverse-default",
					Text = LeftHandlePosition:map(function(p2)
						-- upvalues: GetFormatTimeModule (upval), TimeLength (copy)
						return GetFormatTimeModule(p2 * TimeLength)
					end)
				})
			}),
			VerticalBar = ReactModule.createElement(View, {
				tag = "anchor-center-center size-50-300 bg-system-contrast",
				LayoutOrder = 2
			})
		})
	end
end