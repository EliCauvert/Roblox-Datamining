local Parent = script.Parent.Parent
local Default = require(Parent.Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local ConstantsModule = require(Parent.Constants)
local NetworkingModule = require(Parent.App.Networking)
local ShareLinksNetworking = NetworkingModule.ShareLinksNetworking
local LinkType = NetworkingModule.ShareLinksRodux.Enums.LinkType

return function(PostCreatorId, PostId)
	-- upvalues: LinkType (copy), ShareLinksNetworking (copy), Default (copy), ConstantsModule (copy)
	return function(p1)
		-- upvalues: LinkType (upval), PostCreatorId (copy), PostId (copy), ShareLinksNetworking (upval), Default (upval), ConstantsModule (upval)
		p1:dispatch(ShareLinksNetworking.GetOrGenerateLink.API({
			linkType = LinkType.ContentPost.rawValue(),
			postCreatorId = PostCreatorId,
			postId = PostId
		})):andThen(function(Result)
			-- upvalues: Default (upval), ConstantsModule (upval)
			local ShortUrl = Result.responseBody.shortUrl
			
			if Default then
				assert(Default ~= nil, "ExternalContentSharingProtocol is required")
				Default:shareUrl({
					context = ConstantsModule.ContentFeedContext,
					url = ShortUrl
				})
				
				return
			end
		end):catch(function(_) end)
	end
end