local NetworkingModule = require(script.Parent.Parent.App.Networking)

return function(PostId)
	-- upvalues: NetworkingModule (copy)
	return function(p1)
		-- upvalues: NetworkingModule (upval), PostId (copy)
		p1:dispatch(NetworkingModule.ContentSharingNetworking.DeletePost.API({ postId = PostId })):andThen(function() end):catch(function() end)
	end
end