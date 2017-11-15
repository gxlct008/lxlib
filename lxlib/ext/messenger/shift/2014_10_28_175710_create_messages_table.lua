
local lx, _M, mt = oo{
    _cls_ = '',
    _ext_ = 'migration'
}

local app, lf, tb, str = lx.kit()

-- Run the migrations.

function _M:up()

    Schema.create(Models.table('messages'), function(table)
        table:increments('id')
        table:integer('thread_id'):unsigned()
        table:integer('user_id'):unsigned()
        table:text('body')
        table:timestamps()
        table:softDeletes()
    end)
end

-- Reverse the migrations.

function _M:down()

    Schema.dropIfExists(Models.table('messages'))
end

return _M

