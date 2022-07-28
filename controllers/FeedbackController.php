<?php

namespace app\controllers;

use app\models\Feedback;
use Yii;
use yii\web\Controller;

class FeedbackController extends Controller
{
    public function actionIndex()
    {
        $model = new Feedback();

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // form inputs are valid, do something here
                return;
            }
        }

        return $this->render('index', [
            'model' => $model,
        ]);
    }

}
