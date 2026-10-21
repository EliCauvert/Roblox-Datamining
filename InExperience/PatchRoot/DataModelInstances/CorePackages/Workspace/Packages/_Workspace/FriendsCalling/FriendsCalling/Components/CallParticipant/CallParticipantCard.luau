local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ParticipantAvatarModule = require(script.Parent.ParticipantAvatar)
local RingingIndicatorModule = require(script.Parent.RingingIndicator)
local AvatarSize = FoundationModule.Enums.AvatarSize
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function useAbsoluteSize()
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local function update()
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2(Current.AbsoluteSize)
		end
		
		UseStateResult2(Current.AbsoluteSize)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseRefResult, UseStateResult
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), useAbsoluteSize (copy), ReactModule (copy), View (copy), ParticipantAvatarModule (copy), AvatarSize (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy), RingingIndicatorModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAbsoluteSizeResult, UseAbsoluteSizeResult2 = useAbsoluteSize()
	local UseAbsoluteSizeResult1, UseAbsoluteSizeResult2_1 = useAbsoluteSize()
	local Size2600: number = UseTokensResult.Size.Size_2600
	local Medium: number = UseTokensResult.Padding.Medium
	local _UDim2 = UDim2.fromScale(0.5, 0.5)
	local LargestRatio = 1
	
	if UseAbsoluteSizeResult2.X > 0 and UseAbsoluteSizeResult2.Y > 0 then
		local YDelta = UseAbsoluteSizeResult2.Y - UseAbsoluteSizeResult2_1.Y
		local Smallest = math.min(Size2600, UseAbsoluteSizeResult2.X - 2 * Medium, YDelta - Medium)
		LargestRatio = math.max(Smallest, 0) / Size2600
		_UDim2 = UDim2.new(0.5, 0, 0, (math.min(UseAbsoluteSizeResult2.Y / 2, YDelta - Smallest / 2)))
	end
	return ReactModule.createElement(View, {
		tag = "size-full stroke-standard stroke-default radius-large clip bg-surface-200",
		ref = UseAbsoluteSizeResult,
		testId = p1.testId
	}, {
		Avatar = ReactModule.createElement(View, {
			tag = "anchor-center-center",
			Position = _UDim2,
			Size = UDim2.fromOffset(Size2600, Size2600),
			scale = LargestRatio
		}, {
			Avatar = ReactModule.createElement(ParticipantAvatarModule, {
				avatarSize = AvatarSize.Pictogram,
				isDimmed = p1.isDimmed,
				isSpeaking = p1.isSpeaking,
				ringSize = Size2600,
				userId = p1.userId
			})
		}),
		Footer = ReactModule.createElement(View, {
			tag = "col gap-xsmall position-bottom-left anchor-bottom-left size-full-0 auto-y padding-medium",
			ref = UseAbsoluteSizeResult1
		}, {
			NameRow = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-xsmall size-full-0 auto-y"
			}, {
				Muted = if p1.isMuted then ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					testId = "friends-calling-participant-muted",
					name = IconName.MicrophoneSlash,
					size = IconSize.Small
				}) else nil,
				Name = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "shrink auto-xy text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
					testId = "friends-calling-participant-name",
					Text = p1.name
				})
			}),
			StatusRow = if p1.statusText == nil then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall size-full-0 auto-y"
			}, {
				Status = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
					testId = "friends-calling-participant-status",
					Text = p1.statusText
				}),
				Animation = if p1.showStatusAnimation then ReactModule.createElement(RingingIndicatorModule, {
					LayoutOrder = 2,
					testId = "friends-calling-participant-activity"
				}) else nil
			})
		})
	})
end