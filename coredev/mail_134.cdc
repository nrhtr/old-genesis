
new object $mail_134: $mail_message;

var $dmi_data descriptions = #[];
var $has_text text = ["test email"];
var $mail_message creator = 0;
var $mail_message delivered = 1;
var $mail_message frominet = 1;
var $mail_message header = #[:subj => "test", :from => <$no_one, ["Jeremy Parker <jawparker@gmail.com>"]>, :time => 1322640246, :rcpt => [$user_celthric]];
var $mail_message meta = [["MAIL FROM", "<nrhtr@bitjar.net>"], ["Return-Path", "<jawparker@gmail.com>"], ["X-Original-To", "script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com"], ["Delivered-To", "script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com"], ["Received", "from localhost (localhost.localdomain [127.0.0.1])"], ["Received", "from localhost (localhost.localdomain [127.0.0.1]) by mx7.webfaction.com (Postfix) with ESMTP id 11A54191AB for"], ["Received", "from localhost (localhost.localdomain [127.0.0.1]) by mx7.webfaction.com (Postfix) with ESMTP id 11A54191AB for <script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com>;"], ["Received", "from localhost (localhost.localdomain [127.0.0.1]) by mx7.webfaction.com (Postfix) with ESMTP id 11A54191AB for <script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com>; Tue, 29 Nov 2011 20:58:54 -0600 (CST)"], ["X-Spam-Flag", "NO"], ["X-Spam-Score", "-2.599"], ["X-Spam-Level", ""], ["X-Spam-Status", "No, score=-2.599 tagged_above=-999 required=3"], ["X-Spam-Status", "No, score=-2.599 tagged_above=-999 required=3 tests=[BAYES_00=-2.599]"], ["Received", "from mx7.webfaction.com ([127.0.0.1])"], ["Received", "from mx7.webfaction.com ([127.0.0.1]) by localhost (mail7.webfaction.com [127.0.0.1]) (amavisd-new,"], ["Received", "from mx7.webfaction.com ([127.0.0.1]) by localhost (mail7.webfaction.com [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id LBuKrytubzlK for"], ["Received", "from mx7.webfaction.com ([127.0.0.1]) by localhost (mail7.webfaction.com [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id LBuKrytubzlK for <script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com>;"], ["Received", "from mx7.webfaction.com ([127.0.0.1]) by localhost (mail7.webfaction.com [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id LBuKrytubzlK for <script-d3aaf7322583720c200a35c533338b399fa5394c@mx7.webfaction.com>; Tue, 29 Nov 2011 20:58:52 -0600 (CST)"], ["Received", "from mail-lpp01m010-f54.google.com (mail-lpp01m010-f54.google.com"], ["Received", "from mail-lpp01m010-f54.google.com (mail-lpp01m010-f54.google.com [209.85.215.54])"], ["Received", "from mail-lpp01m010-f54.google.com (mail-lpp01m010-f54.google.com [209.85.215.54]) by mx7.webfaction.com (Postfix) with ESMTP id D2332191D8"], ["Received", "from mail-lpp01m010-f54.google.com (mail-lpp01m010-f54.google.com [209.85.215.54]) by mx7.webfaction.com (Postfix) with ESMTP id D2332191D8 for <nrhtr@bitjar.net>; Tue, 29 Nov 2011 20:58:51 -0600 (CST)"], ["Received", "by lahv2 with SMTP id v2so50207lah.41"], ["Received", "by lahv2 with SMTP id v2so50207lah.41 for <nrhtr@bitjar.net>; Tue, 29 Nov 2011 18:58:50 -0800 (PST)"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma; h=mime-version:date:message-id:subject:from:to:content-type;"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma; h=mime-version:date:message-id:subject:from:to:content-type; bh=xXtulKcDtfvlKnswskIHrI4/8SNaNFckGCK1fCGLL3E=;"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma; h=mime-version:date:message-id:subject:from:to:content-type; bh=xXtulKcDtfvlKnswskIHrI4/8SNaNFckGCK1fCGLL3E=; b=amJjg89qI0pgvoz2ZqH4hDMYSiRfKvcWsCK/ppQo5th5oasob+GRaVzqpqV3tkQ0RV"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma; h=mime-version:date:message-id:subject:from:to:content-type; bh=xXtulKcDtfvlKnswskIHrI4/8SNaNFckGCK1fCGLL3E=; b=amJjg89qI0pgvoz2ZqH4hDMYSiRfKvcWsCK/ppQo5th5oasob+GRaVzqpqV3tkQ0RV reYy/0xugCLi91jmEwfioBlPVlRESvF8+9qtUZFoQ0tOEB36KPMBqpT8KdRtBkiXAj7C"], ["DKIM-Signature", "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma; h=mime-version:date:message-id:subject:from:to:content-type; bh=xXtulKcDtfvlKnswskIHrI4/8SNaNFckGCK1fCGLL3E=; b=amJjg89qI0pgvoz2ZqH4hDMYSiRfKvcWsCK/ppQo5th5oasob+GRaVzqpqV3tkQ0RV reYy/0xugCLi91jmEwfioBlPVlRESvF8+9qtUZFoQ0tOEB36KPMBqpT8KdRtBkiXAj7C S0BrOS8q2EXls3Kow8l3OjA7usgbb99uflzCQ="], ["MIME-Version", "1.0"], ["Received", "by 10.152.162.10 with SMTP id xw10mr81149lab.12.1322621930042; Tue,"], ["Received", "by 10.152.162.10 with SMTP id xw10mr81149lab.12.1322621930042; Tue, 29 Nov 2011 18:58:50 -0800 (PST)"], ["Received", "by 10.152.13.106 with HTTP; Tue, 29 Nov 2011 18:58:50 -0800 (PST)"], ["Date", "Wed, 30 Nov 2011 13:58:50 +1100"], ["Message-ID", "<CA+Nra+1iQkjHeUQ4WttDRReyAqhCGU+EwBOVW+TacvmC9GS7Hg@mail.gmail.com>"], ["Subject", "test"], ["From", "Jeremy Parker <jawparker@gmail.com>"], ["To", "nrhtr@bitjar.net"], ["Content-Type", "text/plain; charset=ISO-8859-1"]];
var $mail_message readers = [$user_celthric];
var $mail_message rfc822_size = 4434;
var $root created_on = 1322640246;
var $root inited = 1;
var $root managed = [$mail_134];
var $root manager = $mail_134;
var $root writers = [$no_one];


