local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local CreatorUserInfoModule = require(Parent.Components.FeedOverlay.CreatorUserInfo)
local CTASidebarModule = require(Parent.Components.FeedOverlay.CTASidebar)
local Text = FoundationModule.Text
local View = FoundationModule.View
local GetRelativeTimeLabelModule = require(Parent.Utils.getRelativeTimeLabel)
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseRefFunction (copy), UseStateFunction (copy), UseEffectOnceFunction (copy), GetRelativeTimeLabelModule (copy), ReactModule (copy), View (copy), CreatorUserInfoModule (copy), Text (copy), CTASidebarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction("")
	local ScaledXLarge = 2 * UseTokensResult.Padding.XLarge
	UseEffectOnceFunction(function()
		-- upvalues: GetRelativeTimeLabelModule (upval), p1 (copy), UseStateResult2 (copy)
		UseStateResult2((GetRelativeTimeLabelModule(p1.uploadedAtTimestamp, DateTime.now().UnixTimestampMillis)))
	end, { p1.uploadedAtTimestamp })
	
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "size-full-0 bg-action-subtle auto-y"
	}, {
		GradientBackdrop = ReactModule.createElement(View, {
			tag = "col size-full-0 bg-contrast",
			ZIndex = 1,
			ref = UseRefResult
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 270,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseTokensResult.Color.OverMedia.OverMedia_0.Color3),
					ColorSequenceKeypoint.new(1, UseTokensResult.Color.OverMedia.OverMedia_0.Color3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.5),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		InfoFrame = ReactModule.createElement(View, {
			tag = "align-x-center align-y-bottom padding-xlarge row position-bottom-center size-full-0 items-end bg-action-subtle anchor-bottom-center auto-y gap-medium",
			ZIndex = 2
		}, {
			PostInfo = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "auto-y bg-action-subtle col align-x-left align-y-top gap-medium grow",
				onAbsoluteSizeChanged = function(Frame)
					-- upvalues: UseRefResult (copy), ScaledXLarge (copy)
					if UseRefResult.current then
						UseRefResult.current.Size = UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y + ScaledXLarge)
					end
				end
			}, {
				CreatorUserInfo = ReactModule.createElement(CreatorUserInfoModule, { layoutOrder = 1, creatorUserId = p1.creatorUserId }),
				Caption = if p1.caption and p1.caption ~= "" then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-medium content-contrast text-wrap text-align-x-left text-align-y-top",
					ZIndex = 2,
					Text = p1.caption
				}) else nil,
				Timestamp = if UseStateResult == "" then nil else ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "auto-xy content-muted text-align-x-left text-align-y-top text-body-small text-wrap",
					Text = UseStateResult
				})
			}),
			CTASidebar = ReactModule.createElement(CTASidebarModule, {
				layoutOrder = 2,
				additionalInfo = p1.additionalInfo,
				creatorUserId = p1.creatorUserId,
				postId = p1.postId
			})
		})
	})
end