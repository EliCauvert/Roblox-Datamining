local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local IsObservingAuthorModule = require(script.Parent.Parent.isObservingAuthor)
local ObservingUserContextModule = require(script.Parent.Parent.ObservingUserContext)
local UseMessageRowContentsModule = require(script.Parent.Parent.useMessageRowContents)
local GetBubbleCornerRadiiModule = require(script.Parent.getBubbleCornerRadii)
local SizingModule = require(script.Parent.Parent.Sizing)
local _ = require(script.Parent.Types)

local function _(p1): string
	local Author = p1.message.author
	
	return `{p1.groupPosition.isFirst}|{p1.groupPosition.isLast}|{if Author == nil then "" else Author.userId}|{if p1.message.deliveryState == nil then "" else p1.message.deliveryState}`
end

return function(Callback)
	-- upvalues: ObservingUserContextModule (copy), SizingModule (copy), UseMessageRowContentsModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), IsObservingAuthorModule (copy), GetBubbleCornerRadiiModule (copy)
	local UseObservingUserIdResult = ObservingUserContextModule.useObservingUserId()
	local CornerRadius = SizingModule.useSizing().bubble.cornerRadius
	local UseMessageRowContentsModuleResult = UseMessageRowContentsModule(Callback)
	local HasReplyLabel = UseMessageRowContentsModuleResult.replyLabel ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Callback (copy), IsObservingAuthorModule (upval), UseObservingUserIdResult (copy), HasReplyLabel (copy), GetBubbleCornerRadiiModule (upval), CornerRadius (copy)
		local CallbackResult = Callback(false)
		local IsObservingAuthorModule1 = IsObservingAuthorModule(CallbackResult.message.author, UseObservingUserIdResult)
		local HasAuthor = CallbackResult.message.author ~= nil
		local Right: string = if IsObservingAuthorModule1 then "right" else "left"
		
		return {
			alignment = Right,
			groupPosition = CallbackResult.groupPosition,
			isObservingUser = IsObservingAuthorModule1,
			showUsername = CallbackResult.groupPosition.isFirst and (HasAuthor and (not IsObservingAuthorModule1 and not HasReplyLabel)),
			showAvatar = not IsObservingAuthorModule1 and (CallbackResult.groupPosition.isLast and HasAuthor),
			cornerRadii = GetBubbleCornerRadiiModule(CallbackResult.groupPosition, Right, CornerRadius),
			deliveryState = CallbackResult.message.deliveryState
		}
	end, {
		Callback,
		SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Callback (copy)
			return SignalsModule.createComputed(function(p2): string
				-- upvalues: Callback (upval)
				local CallbackResult = Callback(p2)
				local Author = CallbackResult.message.author
				
				return `{CallbackResult.groupPosition.isFirst}|{CallbackResult.groupPosition.isLast}|{if Author == nil then "" else Author.userId}|{if CallbackResult.message.deliveryState == nil then "" else CallbackResult.message.deliveryState}`
			end)
		end, { Callback }))),
		UseObservingUserIdResult,
		CornerRadius,
		HasReplyLabel
	})
	
	return {
		alignment = UseMemoResult.alignment,
		groupPosition = UseMemoResult.groupPosition,
		isObservingUser = UseMemoResult.isObservingUser,
		showUsername = UseMemoResult.showUsername,
		showAvatar = UseMemoResult.showAvatar,
		cornerRadii = UseMemoResult.cornerRadii,
		getIdentity = UseMessageRowContentsModuleResult.getIdentity,
		contents = UseMessageRowContentsModuleResult.contents,
		deliveryState = UseMemoResult.deliveryState,
		replyText = UseMessageRowContentsModuleResult.replyText,
		replyLabel = UseMessageRowContentsModuleResult.replyLabel
	}
end