local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AmpUpsellModule = require(Parent.AmpUpsell)
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local SocialUpsellAnalytics = require(Parent.SocialUpsell).Analytics.SocialUpsellAnalytics
local LuaAppAddCarouselAmpUpsellAccessResponses = game:DefineFastFlag("LuaAppAddCarouselAmpUpsellAccessResponses", false)
local LuaAppGameCarouselAmpUpsellActionAccessResponses = game:DefineFastString("LuaAppGameCarouselAmpUpsellActionAccessResponses", "Granted")
local FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics = require(Parent.SharedFlags).FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics
local SocialUpsellButtonClick = if FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics then "socialUpsellButtonClick" else nil
local v1 = if LuaAppAddCarouselAmpUpsellAccessResponses then "," else nil
local Callback = if LuaAppAddCarouselAmpUpsellAccessResponses then function(Text: string, Separator)
	if not Text or Text == "" then
		return {}
	end
	local List = {}
	
	for _, value in string.split(Text, Separator) do
		if value ~= "" then
			table.insert(List, value)
		end
	end
	return List
end else nil

return function(p1, p2, Callback1, p3, p4)
	-- upvalues: UseDispatchFunction (copy), LuaAppAddCarouselAmpUpsellAccessResponses (copy), ReactModule (copy), Callback (copy), LuaAppGameCarouselAmpUpsellActionAccessResponses (copy), v1 (copy), AccessResponseEnum (copy), OpenAmpWizardContainerFunction (copy), FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics (copy), SocialUpsellAnalytics (copy), SocialUpsellButtonClick (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseMemoResult = if LuaAppAddCarouselAmpUpsellAccessResponses then ReactModule.useMemo(function()
		-- upvalues: Callback (upval), LuaAppGameCarouselAmpUpsellActionAccessResponses (upval), v1 (upval)
		return Callback(LuaAppGameCarouselAmpUpsellActionAccessResponses, v1)
	end, {}) else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), LuaAppAddCarouselAmpUpsellAccessResponses (upval), Callback1 (copy), UseMemoResult (copy), AccessResponseEnum (upval), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), p3 (copy), p2 (copy), FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics (upval), p4 (copy), SocialUpsellAnalytics (upval), SocialUpsellButtonClick (upval)
		if p1 and p1 ~= "" then
			local function v13(Granted, _)
				-- upvalues: LuaAppAddCarouselAmpUpsellAccessResponses (upval), Callback1 (upval), UseMemoResult (upval), AccessResponseEnum (upval)
				if LuaAppAddCarouselAmpUpsellAccessResponses then
					if Callback1 then
						for _, value in UseMemoResult do
							if Granted == value then
								Callback1()
								break
							end
						end
						return
					end
				elseif Callback1 and Granted == AccessResponseEnum.Granted then
					Callback1()
				end
			end
			
			return function()
				-- upvalues: UseDispatchResult (upval), OpenAmpWizardContainerFunction (upval), p1 (upval), v13 (copy), p3 (upval), p2 (upval), FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics (upval), p4 (upval), SocialUpsellAnalytics (upval), SocialUpsellButtonClick (upval)
				UseDispatchResult(OpenAmpWizardContainerFunction(p1, v13, nil, p3, nil, p2))
				
				if FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics and p4 then
					SocialUpsellAnalytics.logUpsellEvent(SocialUpsellButtonClick, {
						upsellEntrySurface = p4.upsellEntrySurface,
						upsellComponent = p4.upsellComponent,
						upsellStage = p4.upsellStage,
						upsellPurpose = p4.upsellPurpose
					})
				end
			end
		else
			return nil
		end
	end, {
		p1, p2, Callback1, p3, UseDispatchResult,
		if LuaAppAddCarouselAmpUpsellAccessResponses then UseMemoResult else nil,
		if FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics then p4 else nil
	})
end