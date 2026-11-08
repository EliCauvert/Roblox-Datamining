local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagMomentsCommentTranslationModule = require(Moments.Flags.FFlagMomentsCommentTranslation)
local _ = require(script.Parent.Parent.CommentRowTypes)
local config = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

return function(CommentId, TranslationState, Style)
	-- upvalues: FFlagMomentsCommentTranslationModule (copy), ReactModule (copy), ReactOtterModule (copy), config (copy)
	if FFlagMomentsCommentTranslationModule then
		local UseRefResult = ReactModule.useRef(nil)
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function(p1: number)
			-- upvalues: UseRefResult (copy), ReactOtterModule (upval), config (upval)
			local CurrentFunction: (any) -> () = UseRefResult.current
			
			if p1 >= 1 and CurrentFunction ~= nil then
				CurrentFunction((ReactOtterModule.ease(0, config)))
			end
		end, {})))
		UseRefResult.current = UseAnimatedBindingResult2
		local UseRefResult1 = ReactModule.useRef({
			commentId = CommentId,
			translationState = TranslationState
		})
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (copy), CommentId (copy), TranslationState (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			local Current = UseRefResult1.current
			UseRefResult1.current = {
				commentId = CommentId,
				translationState = TranslationState
			}
			
			if Current.commentId ~= CommentId then
				UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
				
				return
			end
			if Current.translationState ~= nil and TranslationState ~= nil and Current.translationState ~= TranslationState then
				UseAnimatedBindingResult2((ReactOtterModule.instant(1)))
			end
		end, { CommentId, TranslationState })
		
		return ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), Style (copy), UseAnimatedBindingResult (copy)
			return ReactModule.joinBindings({ style = Style, fade = UseAnimatedBindingResult }):map(function(p1)
				local Style = p1.style
				local Transparency = Style.Transparency or 0
				
				return {
					Color3 = Style.Color3,
					Transparency = Transparency + (1 - Transparency) * p1.fade
				}
			end)
		end, { Style, UseAnimatedBindingResult })
	else
		return Style
	end
end