local UrlModule = require(script.Parent.Parent.Parent.InGameMenu.Network.Url)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Promise = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Promise

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

return function(Value, Value1, ExternalId: string, Value2, Comments, ReasonType)
	-- upvalues: Players (copy), UrlModule (copy), HttpService (copy), Promise (copy)
	local Type = 1
	
	if ExternalId == "" or ExternalId == nil then
		ExternalId = "UID_" .. game.GameId
		Type = 2
	end
	local config = {
		Method = "POST",
		Url = string.format("%sfeedback-api/v1/feedback/create-localization", UrlModule.APIS_URL),
		Body = HttpService:JSONEncode({
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
		}),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return Promise.new(function(Callback, Callback1)
		-- upvalues: config (copy), HttpService (upval)
		spawn(function()
			-- upvalues: config (upval), Callback (copy), Callback1 (copy), HttpService (upval)
			local _ = HttpService:RequestInternal(config):Start(function(p1, p2)
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