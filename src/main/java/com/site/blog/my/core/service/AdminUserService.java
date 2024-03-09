package com.site.blog.my.core.service;

import com.site.blog.my.core.entity.AdminUser;

public interface AdminUserService {

    AdminUser login(String userName, String password);

    /**
     * Obtain user information
     *
     * @param loginUserId
     * @return
     */
    AdminUser getUserDetailById(Integer loginUserId);

    /**
     * CHANGE THE PASSWORD OF THE CURRENT LOGGED IN USER
     *
     * @param loginUserId
     * @param originalPassword
     * @param newPassword
     * @return
     */
    Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    /**
     * Modify the name information of the current logged-in user
     *
     * @param loginUserId
     * @param loginUserName
     * @param nickName
     * @return
     */
    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

}
