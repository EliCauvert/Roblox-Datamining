local urlModule = require(script.Parent.Parent.Parent.InGameMenu.Network.Url)
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promise = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Promise
local getFFlagEnableSendImageFeedbackToBackendModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)

local function _(p1, p2, p3)
	-- upvalues: httpService (ref)
	return httpService:RequestInternal(p1):Start(function(p4, p5)
		-- upvalues: p2 (ref), p3 (ref)
		if p4 then
			p2()
			
			return
		end
		p3(tostring(p5.StatusMessage))
	end)
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getFFlagEnableSendImageFeedbackToBackendModule (ref), playersService (ref), constantsModule (ref), urlModule (ref), httpService (ref), promise (ref)
	local t
	local _ = nil
	
	if getFFlagEnableSendImageFeedbackToBackendModule() then
		local inGameTranslations = constantsModule.ServiceSourceType.InGameTranslations
		
		if p4 == "" or p4 == nil then
			p4 = "UID_" .. game.GameId
			inGameTranslations = constantsModule.ServiceSourceType.InGameTranslationsNoEntryId
		end
		if p1 == constantsModule.ContentType.Image then
			inGameTranslations = constantsModule.ServiceSourceType.InGameUniverseAndImageAsset
		end
		t = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = inGameTranslations, ExternalId = p4 },
					Source = { ContentType = p1, Value = p2 },
					Translation = { ContentType = p1, Value = p3 }
				},
				Locale = if playersService.LocalPlayer.LocaleId then playersService.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = p7,
				Suggestion = {
					ContentType = constantsModule.ContentType.Text,
					Value = p5
				},
				Comments = p6
			}
		}
	else
		local var1 = 1
		
		if p4 == "" or p4 == nil then
			p4 = "UID_" .. game.GameId
			var1 = 2
		end
		t = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = var1, ExternalId = p4 },
					Source = { ContentType = 1, Value = p2 },
					Translation = { ContentType = 1, Value = p3 }
				},
				Locale = if playersService.LocalPlayer.LocaleId then playersService.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = p7,
				Suggestion = { ContentType = 1, Value = p5 },
				Comments = p6
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
	
	return promise.new(function(p8, p9)
		-- upvalues: t_1 (ref), httpService (copy)
		spawn(function()
			-- upvalues: t_1 (copy), p8 (ref), p9 (ref), httpService (copy)
			local _ = httpService:RequestInternal(t_1):Start(function(p10, p11)
				-- upvalues: p8 (ref), p9 (ref)
				if p10 then
					p8()
					
					return
				end
				p9(tostring(p11.StatusMessage))
			end)
		end)
	end)
end