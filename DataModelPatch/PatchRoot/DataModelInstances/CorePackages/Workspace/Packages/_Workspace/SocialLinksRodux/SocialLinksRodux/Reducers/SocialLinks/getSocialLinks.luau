local Parent = script:FindFirstAncestor("SocialLinksRodux").Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local FFlagProfileEnableSocialNetworksUsernames = require(Parent.SharedFlags).FFlagProfileEnableSocialNetworksUsernames
local list = {
	"facebook",
	"twitter",
	"youtube",
	"twitch",
	"guilded"
}

return function(p1)
	-- upvalues: RoduxModule (copy), FFlagProfileEnableSocialNetworksUsernames (copy), CryoModule (copy), list (copy)
	return RoduxModule.createReducer({}, {
		[p1.SocialLinksNetworking.GetSocialLinks.Succeeded.name] = function(p2, p3)
			-- upvalues: FFlagProfileEnableSocialNetworksUsernames (upval), CryoModule (upval), list (upval)
			local Text = tostring(p3.namedIds.users)
			
			if not FFlagProfileEnableSocialNetworksUsernames then
				return CryoModule.Dictionary.join(p2, { [Text] = p3.responseBody })
			end
			local t = {}
			
			if p3.queryArgs.alwaysReturnUrls then
				CryoModule.List.map(list, function(Key)
					-- upvalues: t (copy), p3 (copy), p2 (copy), Text (copy)
					t[Key] = {
						url = p3.responseBody[Key],
						username = if p2[Text] then p2[Text][Key].username else nil
					}
				end)
			else
				CryoModule.List.map(list, function(Key)
					-- upvalues: t (copy), p2 (copy), Text (copy), p3 (copy)
					t[Key] = {
						url = if p2[Text] then p2[Text][Key].url else nil,
						username = p3.responseBody[Key]
					}
				end)
			end
			return CryoModule.Dictionary.union(p2, { [Text] = t })
		end
	})
end