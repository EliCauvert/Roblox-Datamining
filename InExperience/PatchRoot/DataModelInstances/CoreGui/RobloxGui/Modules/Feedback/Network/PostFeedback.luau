local urlModule = require(script.Parent.Parent.Parent.InGameMenu.Network.Url)
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promise = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Promise
local getFFlagEnableSendImageFeedbackToBackendModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)

local function _(p0, p1, p2) --[[ line: 28 | named "request" ]]
	-- upvalues: httpService (ref)
	return httpService:RequestInternal(p0):Start(function(p3, p4) --[[ line: 29 ]]
		-- upvalues: p1 (ref), p2 (ref)
		if p3 then
			p1()
			
			return
		end
		p2(tostring(p4.StatusMessage))
	end)
end

return function(p5, p6, p7, p8, p9, p10, p11) --[[ line: 38 ]]
	-- upvalues: getFFlagEnableSendImageFeedbackToBackendModule (ref), playersService (ref), constantsModule (ref), urlModule (ref), httpService (ref), promise (ref)
	local t
	local _ = nil
	
	if getFFlagEnableSendImageFeedbackToBackendModule() then
		local inGameTranslations = constantsModule.ServiceSourceType.InGameTranslations
		
		if p8 == "" or p8 == nil then
			p8 = "UID_" .. game.GameId
			inGameTranslations = constantsModule.ServiceSourceType.InGameTranslationsNoEntryId
		end
		if p5 == constantsModule.ContentType.Image then
			inGameTranslations = constantsModule.ServiceSourceType.InGameUniverseAndImageAsset
		end
		t = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = inGameTranslations, ExternalId = p8 },
					Source = { ContentType = p5, Value = p6 },
					Translation = { ContentType = p5, Value = p7 }
				},
				Locale = if playersService.LocalPlayer.LocaleId then playersService.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = p11,
				Suggestion = {
					ContentType = constantsModule.ContentType.Text,
					Value = p9
				},
				Comments = p10
			}
		}
	else
		local var5 = 1
		
		if p8 == "" or p8 == nil then
			p8 = "UID_" .. game.GameId
			var5 = 2
		end
		t = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = var5, ExternalId = p8 },
					Source = { ContentType = 1, Value = p6 },
					Translation = { ContentType = 1, Value = p7 }
				},
				Locale = if playersService.LocalPlayer.LocaleId then playersService.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = p11,
				Suggestion = { ContentType = 1, Value = p9 },
				Comments = p10
			}
		}
	end
	local t_1 = {
		Method = "POST",
		Url = string.format("%sfeedback-api/v1/feedback/create-localization", urlModule.APIS_URL),
		Body = httpService:JSONEncode(t),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promise.new(function(p12, p13) --[[ line: 136 ]]
		-- upvalues: t_1 (ref), httpService (copy)
		spawn(function() --[[ line: 137 ]]
			-- upvalues: t_1 (copy), p12 (ref), p13 (ref), httpService (copy)
			local _ = httpService:RequestInternal(t_1):Start(function(p14, p15) --[[ line: 29 ]]
				-- upvalues: p12 (ref), p13 (ref)
				if p14 then
					p12()
					
					return
				end
				p13(tostring(p15.StatusMessage))
			end)
		end)
	end)
end