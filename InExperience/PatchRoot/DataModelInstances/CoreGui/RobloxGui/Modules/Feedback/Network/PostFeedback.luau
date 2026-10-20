local UrlModule = require(script.Parent.Parent.Parent.InGameMenu.Network.Url)
local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Promise = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Promise
local GetFFlagEnableSendImageFeedbackToBackendModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)

local function _(Options, p1, p2)
	-- upvalues: HttpService (copy)
	return HttpService:RequestInternal(Options):Start(function(p3, p4)
		-- upvalues: p1 (copy), p2 (copy)
		if p3 then
			p1()
			
			return
		else
			p2((tostring(p4.StatusMessage)))
		end
	end)
end

return function(ContentType, Value, Value1, ExternalId: string, Value2, Comments, ReasonType)
	-- upvalues: GetFFlagEnableSendImageFeedbackToBackendModule (copy), Players (copy), ConstantsModule (copy), UrlModule (copy), HttpService (copy), Promise (copy)
	local config = nil
	if GetFFlagEnableSendImageFeedbackToBackendModule() then
		local InGameTranslations = ConstantsModule.ServiceSourceType.InGameTranslations
		
		if ExternalId == "" or ExternalId == nil then
			ExternalId = "UID_" .. game.GameId
			InGameTranslations = ConstantsModule.ServiceSourceType.InGameTranslationsNoEntryId
		end
		if ContentType == ConstantsModule.ContentType.Image then
			InGameTranslations = ConstantsModule.ServiceSourceType.InGameUniverseAndImageAsset
		end
		config = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = InGameTranslations, ExternalId = ExternalId },
					Source = { ContentType = ContentType, Value = Value },
					Translation = if ContentType == ConstantsModule.ContentType.Image and (Value1 == nil or Value1 == "") then nil else { ContentType = ContentType, Value = Value1 }
				},
				Locale = if Players.LocalPlayer.LocaleId then Players.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = ReasonType,
				Suggestion = {
					ContentType = ConstantsModule.ContentType.Text,
					Value = Value2
				},
				Comments = Comments
			}
		}
	else
		local Type = 1
		
		if ExternalId == "" or ExternalId == nil then
			ExternalId = "UID_" .. game.GameId
			Type = 2
		end
		config = {
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = Type, ExternalId = ExternalId },
					Source = { ContentType = 1, Value = Value },
					Translation = { ContentType = 1, Value = Value1 }
				},
				Locale = if Players.LocalPlayer.LocaleId then Players.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = ReasonType,
				Suggestion = { ContentType = 1, Value = Value2 },
				Comments = Comments
			}
		}
	end
	local config1 = {
		Method = "POST",
		Url = string.format("%sfeedback-api/v1/feedback/create-localization", UrlModule.APIS_URL),
		Body = HttpService:JSONEncode(config),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return Promise.new(function(Callback, Callback1)
		-- upvalues: config1 (copy), HttpService (upval)
		spawn(function()
			-- upvalues: config1 (upval), Callback (copy), Callback1 (copy), HttpService (upval)
			local _ = HttpService:RequestInternal(config1):Start(function(p1, p2)
				-- upvalues: Callback (copy), Callback1 (copy)
				if p1 then
					Callback()
					
					return
				else
					Callback1((tostring(p2.StatusMessage)))
				end
			end)
		end)
	end)
end