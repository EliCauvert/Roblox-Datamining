local urlModule = require(script.Parent.Parent.Parent.InGameMenu.Network.Url)
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local promise = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Promise

local function _(p0, p1, p2) --[[ line: 22 | named "request" ]]
	-- upvalues: httpService (ref)
	return httpService:RequestInternal(p0):Start(function(p3, p4) --[[ line: 23 ]]
		-- upvalues: p1 (ref), p2 (ref)
		if p3 then
			p1()
			
			return
		end
		p2(tostring(p4.StatusMessage))
	end)
end

return function(p5, p6, p7, p8, p9, p10) --[[ line: 32 ]]
	-- upvalues: playersService (ref), urlModule (ref), httpService (ref), promise (ref)
	local var3 = 1
	
	if p7 == "" or p7 == nil then
		p7 = "UID_" .. game.GameId
		var3 = 2
	end
	local t = {
		Method = "POST",
		Url = string.format("%sfeedback-api/v1/feedback/create-localization", urlModule.APIS_URL),
		Body = httpService:JSONEncode({
			LocalizationFeedback = {
				FeedbackTarget = {
					ServiceSource = { Type = var3, ExternalId = p7 },
					Source = { ContentType = 1, Value = p5 },
					Translation = { ContentType = 1, Value = p6 }
				},
				Locale = if playersService.LocalPlayer.LocaleId then playersService.LocalPlayer.LocaleId:gsub("-", "_") else "",
				ReasonType = p10,
				Suggestion = { ContentType = 1, Value = p8 },
				Comments = p9
			}
		}),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promise.new(function(p11, p12) --[[ line: 87 ]]
		-- upvalues: t (ref), httpService (copy)
		spawn(function() --[[ line: 88 ]]
			-- upvalues: t (copy), p11 (ref), p12 (ref), httpService (copy)
			local _ = httpService:RequestInternal(t):Start(function(p13, p14) --[[ line: 23 ]]
				-- upvalues: p11 (ref), p12 (ref)
				if p13 then
					p11()
					
					return
				end
				p12(tostring(p14.StatusMessage))
			end)
		end)
	end)
end